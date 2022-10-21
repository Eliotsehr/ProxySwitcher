#include <stdio.h>
#include <spawn.h>
#import <Foundation/Foundation.h>
#import "MBWiFiProxyHandler.h"
#import "objc/runtime.h"
#import "SCNetworkHeader.h"

static void enable(CFNotificationCenterRef center,
                   void *observer,
                   CFStringRef name,
                   const void *object,
                   CFDictionaryRef userInfo) {
    NSLog(@"ProxySwitcherd: Enable proxy");
    [[objc_getClass("MBWiFiProxyHandler") sharedInstance] enableProxy];
}

static void disable(CFNotificationCenterRef center,
                    void *observer,
                    CFStringRef name,
                    const void *object,
                    CFDictionaryRef userInfo) {
    NSLog(@"ProxySwitcherd: Disable proxy");
    [[objc_getClass("MBWiFiProxyHandler") sharedInstance] disableProxy];
}

static void refreshPreferences(CFNotificationCenterRef center,
                    void *observer,
                    CFStringRef name,
                    const void *object,
                    CFDictionaryRef userInfo) {
    NSLog(@"ProxySwitcherd: Refresh preferences");
    [[objc_getClass("MBWiFiProxyHandler") sharedInstance] refreshPreferences];
}

int main(int argc, char **argv, char **envp) {
    NSLog(@"ProxySwitcherd: ProxySwitcherd is launched!");
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    enable,
                                    CFSTR("com.esehr.proxyswitcherd.enable"),
                                    NULL,
                                    CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    disable,
                                    CFSTR("com.esehr.proxyswitcherd.disable"),
                                    NULL,
                                    CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    refreshPreferences,
                                    CFSTR("com.esehr.proxyswitcherd.refreshPreferences"),
                                    NULL,
                                    CFNotificationSuspensionBehaviorCoalesce);
    CFRunLoopRun();
    return 0;
}

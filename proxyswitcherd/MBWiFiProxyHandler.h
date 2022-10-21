#import <Foundation/Foundation.h>
#import "SCNetworkHeader.h"

@interface MBWiFiProxyHandler : NSObject

@property (nonatomic, strong, readonly) NSDictionary *preferences;

+ (instancetype)sharedInstance;

- (void)enableProxy;
- (void)disableProxy;
- (void)refreshPreferences;

@end

#import <UIKit/UIKit.h>
#import <HockeySDK/HockeySDK.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, BITHockeyManagerDelegate, BITUpdateManagerDelegate, BITCrashManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

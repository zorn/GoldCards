#import <UIKit/UIKit.h>
#import <HockeySDK/HockeySDK.h>

@class ZORNCoreDataStack;

@interface AppDelegate : UIResponder <UIApplicationDelegate, BITHockeyManagerDelegate, BITUpdateManagerDelegate, BITCrashManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly) ZORNCoreDataStack *coreDataStack;

@end

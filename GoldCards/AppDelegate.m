#import "AppDelegate.h"
#import "ZORNCoreDataStack.h"
#import "NSURL+ZORNKitAdditions.h"
#import "GCCoreDataManager.h"

@interface AppDelegate ()
@property (strong) ZORNCoreDataStack *coreDataStack;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self setupCoreDataStack];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Private

- (void)setupCoreDataStack
{
    if (self.coreDataStack) {
        DDLogWarn(@"Tried to setupCoreDataStack when it was already built.");
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"GoldCardsSchema" withExtension:@"momd"];
    NSURL *persistentStoreURL = [[NSURL zorn_applicationDocumentsDirectory] URLByAppendingPathComponent:@"GoldCards.sqlite"];
    
    self.coreDataStack = [[ZORNCoreDataStack alloc] init];
    self.coreDataStack.managedObjectModelURL = modelURL;
    self.coreDataStack.persistentStoreURL = persistentStoreURL;
    
    NSError *error = nil;
    if (![self.coreDataStack buildStackWithError:&error]) {
        NSLog(@"error building core data stack: %@", error);
        abort();
    }
    
    // if this is a fresh db, make sure we import all the stuff
    GCCoreDataManager *coreDateManager = [[GCCoreDataManager alloc] init];
    coreDateManager.coreDataStack = self.coreDataStack;
    if ([coreDateManager isStoreEmpty]) {
        NSError *error = nil;
        if (![coreDateManager initializeEmptyStore:&error]) {
            DDLogError(@"initializeEmptyStore had error: %@", error);
            DDLogError(@"skipping core data setup");
            [self teardownCoreDataStack];
        }
    }
}

- (void)teardownCoreDataStack
{
    NSError *error = nil;
    if (![self.coreDataStack tearDownStackWithError:&error]) {
        NSLog(@"error tearing down core data stack: %@", error);
        abort();
    }
    self.coreDataStack = nil;
}

@end

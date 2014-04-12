#import "AppDelegate.h"
#import "ZORNCoreDataStack.h"
#import "NSURL+ZORNKitAdditions.h"
#import "GCCoreDataManager.h"
#import "GCMainMenuViewController.h"
#import "ZORNLogFormatter.h"

@interface AppDelegate ()
@property (strong, nonatomic) DDFileLogger *fileLogger;
@property (strong) ZORNCoreDataStack *coreDataStack;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initializeHockeyAppAndLogging];
    [self setupCoreDataStack];
        
    UINavigationController *navVC = (UINavigationController *)self.window.rootViewController;
    UIViewController *vc = [navVC topViewController];
    [(GCMainMenuViewController *)vc setManagedObjectContext:self.coreDataStack.managedObjectContext];
    
    return YES;
}

#pragma mark - Private

- (void)initializeHockeyAppAndLogging
{
    [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"76db44cfa545e1e1fd8905a5749b8587" delegate:self];
    
#ifndef CONFIGURATION_DEBUG
    // initialize before HockeySDK, so the delegate can access the file logger
    self.fileLogger = [[DDFileLogger alloc] init];
    self.fileLogger.maximumFileSize = (1024 * 512); // 512 KByte
    self.fileLogger.logFileManager.maximumNumberOfLogFiles = 1;
    self.fileLogger.logFormatter = [[ZORNLogFormatter alloc] init];
    [self.fileLogger rollLogFileWithCompletionBlock:nil];
    [DDLog addLogger:self.fileLogger];
    
    [[BITHockeyManager sharedHockeyManager].authenticator setAuthenticationSecret:@"24e2d2d3f536ae839e2d15e50c0b1e90"];
    [[BITHockeyManager sharedHockeyManager].authenticator setIdentificationType:BITAuthenticatorIdentificationTypeHockeyAppEmail];
    [[BITHockeyManager sharedHockeyManager] startManager];
    [[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];
    
    DDASLLogger *aslLogger = [DDASLLogger sharedInstance];
    aslLogger.logFormatter = [[ZORNLogFormatter alloc] init];
    [DDLog addLogger:aslLogger];
#else
    [[BITHockeyManager sharedHockeyManager] setDisableCrashManager:YES];
    [[BITHockeyManager sharedHockeyManager] startManager];
    DDTTYLogger *ttyLogger = [DDTTYLogger sharedInstance];
    ttyLogger.logFormatter = [[ZORNLogFormatter alloc] init];
    [DDLog addLogger:ttyLogger];
#endif
}

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
    GCCoreDataManager *coreDateManager = [[GCCoreDataManager alloc] initWithCoreDataStack:self.coreDataStack];
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

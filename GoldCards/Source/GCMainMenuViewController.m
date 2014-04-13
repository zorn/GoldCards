#import "GCMainMenuViewController.h"
#import "GCHeroesListViewController.h"
#import "UIStoryboardSegue+ZORNAdditions.h"
#import "GCModels.h"
#import "ZORNCoreDataStack.h"
#import "GCCardListViewController.h"
#import "GCMechanicListViewController.h"
#import "GCAchievementListViewController.h"
#import "GCQuestListViewController.h"
#import "PBWebViewController.h"
#import "PBSafariActivity.h"

@interface GCMainMenuViewController ()
@property (strong) NSURL *aboutPageURL;
@end

@implementation GCMainMenuViewController

@synthesize aboutPageURL=_aboutPageURL;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"heroList"]) {
        UIViewController *heroListVC = [segue zorn_destinationViewControllerOfClass:[GCHeroesListViewController class]];
        [(GCHeroesListViewController *)heroListVC setHeroes:[GCHero orderedHeroesInManagedObjectContext:self.managedObjectContext]];
    } else if ([segue.identifier isEqualToString:@"cardList"]) {
        UIViewController *cardListVC = [segue zorn_destinationViewControllerOfClass:[GCCardListViewController class]];
        [(GCCardListViewController *)cardListVC setManagedObjectContext:self.managedObjectContext];
    } else if ([segue.identifier isEqualToString:@"mechanicList"]) {
        UIViewController *mechanicListVC = [segue zorn_destinationViewControllerOfClass:[GCMechanicListViewController class]];
        [(GCMechanicListViewController *)mechanicListVC setManagedObjectContext:self.managedObjectContext];
    } else if ([segue.identifier isEqualToString:@"achievementList"]) {
        UIViewController *achievementListVC = [segue zorn_destinationViewControllerOfClass:[GCAchievementListViewController class]];
        [(GCAchievementListViewController *)achievementListVC setManagedObjectContext:self.managedObjectContext];
    } else if ([segue.identifier isEqualToString:@"questList"]) {
        UIViewController *questListVC = [segue zorn_destinationViewControllerOfClass:[GCQuestListViewController class]];
        [(GCQuestListViewController *)questListVC setManagedObjectContext:self.managedObjectContext];
    } else if ([segue.identifier isEqualToString:@"about"]) {
        PBWebViewController * aboutVC = (PBWebViewController *)[segue zorn_destinationViewControllerOfClass:[PBWebViewController class]];
        [aboutVC setURL:[self aboutPageURL]];
        PBSafariActivity *activity = [[PBSafariActivity alloc] init];
        aboutVC.applicationActivities = @[activity];
        aboutVC.excludedActivityTypes = @[UIActivityTypeMail, UIActivityTypeMessage, UIActivityTypePostToWeibo];
        aboutVC.showsNavigationToolbar = YES;
    }
}

#pragma mark - About Page URL

- (void)setAboutPageURL:(NSURL *)aboutPageURL
{
    _aboutPageURL = aboutPageURL;
}

- (NSURL *)aboutPageURL
{
	if (!_aboutPageURL) {
		// create a dynamic about page showing the current version
		NSString *buildNumber = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        NSString *versionAndBuildNumber = [NSString stringWithFormat:@"%@ (%@)", version, buildNumber];
        
		// original source
		NSString *path = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"];
		NSMutableString *aboutPageSource = [[NSMutableString alloc] initWithString:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil]];
		
		// swap version
		[aboutPageSource replaceOccurrencesOfString:@"{{appVersion}}" withString:versionAndBuildNumber options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aboutPageSource length])];
		
		// set the URL to the logo image
		NSString *pathToAboutImage = [[NSBundle mainBundle] pathForResource:@"iTunesArtwork" ofType:@"png"];
		[aboutPageSource replaceOccurrencesOfString:@"{{pathToIcon}}" withString:[@"file://" stringByAppendingString:pathToAboutImage] options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aboutPageSource length])];
		
		// store new about page
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSURL *urlToNewAbout = [NSURL fileURLWithPath:[documentsDirectory stringByAppendingFormat:@"/about.html"]];
		[aboutPageSource writeToURL:urlToNewAbout atomically:YES encoding:NSUTF8StringEncoding error:nil];
		
		_aboutPageURL = urlToNewAbout;
	}
	return _aboutPageURL;
}

@end

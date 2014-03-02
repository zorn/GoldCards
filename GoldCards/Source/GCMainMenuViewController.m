#import "GCMainMenuViewController.h"
#import "GCHerosListViewController.h"
#import "UIStoryboardSegue+ZORNAdditions.h"
#import "GCModels.h"
#import "ZORNCoreDataStack.h"

@implementation GCMainMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"heroList"]) {
        UIViewController *heroListVC = [segue zorn_destinationViewControllerOfClass:[GCHerosListViewController class]];
        [(GCHerosListViewController *)heroListVC setHeros:[GCHero orderedHerosInManagedObjectContext:self.managedObjectContext]];
    }
}

@end

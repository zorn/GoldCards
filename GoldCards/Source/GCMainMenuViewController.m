#import "GCMainMenuViewController.h"
#import "GCHeroesListViewController.h"
#import "UIStoryboardSegue+ZORNAdditions.h"
#import "GCModels.h"
#import "ZORNCoreDataStack.h"
#import "GCCardListViewController.h"
#import "GCMechanicListViewController.h"

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
        UIViewController *heroListVC = [segue zorn_destinationViewControllerOfClass:[GCHeroesListViewController class]];
        [(GCHeroesListViewController *)heroListVC setHeroes:[GCHero orderedHeroesInManagedObjectContext:self.managedObjectContext]];
    } else if ([segue.identifier isEqualToString:@"cardList"]) {
        UIViewController *cardListVC = [segue zorn_destinationViewControllerOfClass:[GCCardListViewController class]];
        [(GCCardListViewController *)cardListVC setManagedObjectContext:self.managedObjectContext];
    } else if ([segue.identifier isEqualToString:@"mechanicList"]) {
        UIViewController *mechanicListVC = [segue zorn_destinationViewControllerOfClass:[GCMechanicListViewController class]];
        [(GCMechanicListViewController *)mechanicListVC setManagedObjectContext:self.managedObjectContext];
    }
}

@end

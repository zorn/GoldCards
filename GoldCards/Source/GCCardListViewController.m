#import "GCCardListViewController.h"
#import "GCModels.h"
#import "UIStoryboardSegue+ZORNAdditions.h"
#import "GCCardDetailViewController.h"

@implementation GCCardListViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.hero) {
        self.fetchedResultsControllerPredicate = [NSPredicate predicateWithFormat:@"hero == %@", self.hero];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"cardDetail"]) {
        
        UIViewController *vc = [segue zorn_destinationViewControllerOfClass:[GCCardDetailViewController class]];
        GCCard *selectedCard = nil;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if ([self.savedSearchTerm length] > 0){
            UITableView *searchTableView = self.searchDisplayController.searchResultsTableView;
            indexPath = [searchTableView indexPathForSelectedRow];
            selectedCard = [[self fetchedResultsControllerForTableView:searchTableView] objectAtIndexPath:indexPath];
        } else {
            selectedCard = [[self fetchedResultsControllerForTableView:self.tableView] objectAtIndexPath:indexPath];
        }
        [(GCCardDetailViewController *)vc setCard:selectedCard];
    }
}

#pragma mark - ZORNCoreDataTableViewController

- (NSString *)entityName
{
    return [GCCard entityName];
}

- (NSString *)sectionNameKeyPath
{
    return @"zorncds_uppercaseFirstLetterOfName";
}

- (NSArray *)sortDescriptors
{
    NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    return @[sortByName];
}

- (NSString *)reuseIdentifierForTableViewCell
{
    return @"CardCell";
}

- (NSPredicate *)searchPredicateForSearchString:(NSString *)searchString
{
    return [NSPredicate predicateWithFormat:@"name contains[cd] %@ OR summary contains[cd] %@", searchString, searchString];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath forTableView:(UITableView *)tableView
{
    NSFetchedResultsController *frc = [self fetchedResultsControllerForTableView:tableView];
    GCCard *card = (GCCard *)[frc objectAtIndexPath:indexPath];
    NSAssert([card isKindOfClass:[GCCard class]], @"???");
    cell.textLabel.text = card.name;
    cell.detailTextLabel.text = card.summary;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[[[self fetchedResultsControllerForTableView:tableView] sections] objectAtIndex:section] name];
}

@end

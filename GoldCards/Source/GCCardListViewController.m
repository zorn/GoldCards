#import "GCCardListViewController.h"
#import "GCModels.h"

@interface GCCardListViewController ()

@end

@implementation GCCardListViewController

- (NSString *)entityName
{
    return [GCCard entityName];
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
    return [NSPredicate predicateWithFormat:@"name contains[cd] %@", searchString];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath forTableView:(UITableView *)tableView
{
    NSFetchedResultsController *frc = [self fetchedResultsControllerForTableView:tableView];
    GCCard *card = (GCCard *)[frc objectAtIndexPath:indexPath];
    NSAssert([card isKindOfClass:[GCCard class]], @"???");
    cell.textLabel.text = card.name;
}

@end

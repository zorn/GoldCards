#import "GCMechanicListViewController.h"
#import "GCModels.h"

@interface GCMechanicListViewController ()

@end

@implementation GCMechanicListViewController

#pragma mark - ZORNCoreDataTableViewController

- (NSString *)entityName
{
    return [GCMechanic entityName];
}

- (NSArray *)sortDescriptors
{
    NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    return @[sortByName];
}

- (NSString *)reuseIdentifierForTableViewCell
{
    return @"MechanicCell";
}

- (NSPredicate *)searchPredicateForSearchString:(NSString *)searchString
{
    return [NSPredicate predicateWithFormat:@"name contains[cd] %@", searchString];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath forTableView:(UITableView *)tableView
{
    NSFetchedResultsController *frc = [self fetchedResultsControllerForTableView:tableView];
    GCMechanic *mechanic = (GCMechanic *)[frc objectAtIndexPath:indexPath];
    NSAssert([mechanic isKindOfClass:[GCMechanic class]], @"???");
    cell.textLabel.text = mechanic.name;
    cell.detailTextLabel.text =  mechanic.summary;
}

@end

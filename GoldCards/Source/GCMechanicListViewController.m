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

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath forTableView:(UITableView *)tableView
{
    NSFetchedResultsController *frc = [self fetchedResultsControllerForTableView:tableView];
    GCMechanic *mechanic = (GCMechanic *)[frc objectAtIndexPath:indexPath];
    NSAssert([mechanic isKindOfClass:[GCMechanic class]], @"???");
    cell.textLabel.text = mechanic.name;
    cell.detailTextLabel.text =  mechanic.summary;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end

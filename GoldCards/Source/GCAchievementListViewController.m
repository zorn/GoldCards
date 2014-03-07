#import "GCAchievementListViewController.h"
#import "GCModels.h"

@interface GCAchievementListViewController ()

@end

@implementation GCAchievementListViewController

#pragma mark - ZORNCoreDataTableViewController

- (NSString *)entityName
{
    return [GCAchievement entityName];
}

- (NSArray *)sortDescriptors
{
    NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    return @[sortByName];
}

- (NSString *)reuseIdentifierForTableViewCell
{
    return @"AchievementCell";
}

- (NSPredicate *)searchPredicateForSearchString:(NSString *)searchString
{
    return [NSPredicate predicateWithFormat:@"name contains[cd] %@", searchString];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath forTableView:(UITableView *)tableView
{
    NSFetchedResultsController *frc = [self fetchedResultsControllerForTableView:tableView];
    GCAchievement *achievement = (GCAchievement *)[frc objectAtIndexPath:indexPath];
    NSAssert([achievement isKindOfClass:[GCAchievement class]], @"???");
    cell.textLabel.text = achievement.name;
    cell.detailTextLabel.text =  achievement.summary;
}


@end
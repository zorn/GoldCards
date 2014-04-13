#import "GCQuestListViewController.h"
#import "GCModels.h"

@interface GCQuestListViewController ()

@end

@implementation GCQuestListViewController

#pragma mark - ZORNCoreDataTableViewController

- (NSString *)entityName
{
    return [GCQuest entityName];
}

- (NSArray *)sortDescriptors
{
    NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    return @[sortByName];
}

- (NSString *)reuseIdentifierForTableViewCell
{
    return @"QuestCell";
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath forTableView:(UITableView *)tableView
{
    NSFetchedResultsController *frc = [self fetchedResultsControllerForTableView:tableView];
    GCQuest *quest = (GCQuest *)[frc objectAtIndexPath:indexPath];
    NSAssert([quest isKindOfClass:[GCQuest class]], @"???");
    cell.textLabel.text = quest.name;
    cell.detailTextLabel.text =  quest.summary;
}

@end

#import "GCHeroesListViewController.h"
#import "GCModels.h"
#import "GCHeroDetailViewController.h"

@interface GCHeroesListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation GCHeroesListViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - Storyboards

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"heroDetail"]) {
        GCHeroDetailViewController *vc = (GCHeroDetailViewController *)[segue destinationViewController];
        NSAssert([vc isKindOfClass:[GCHeroDetailViewController class]], @"???");
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        vc.hero = [self.heroes objectAtIndex:indexPath.row];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.heroes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GCHero *hero = [self.heroes objectAtIndex:indexPath.row];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HeroCellSubtitle"];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.heroClass;
    return cell;
}

@end

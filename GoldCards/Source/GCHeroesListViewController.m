#import "GCHeroesListViewController.h"
#import "GCModels.h"

@interface GCHeroesListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation GCHeroesListViewController

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.heroes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GCHero *hero = [self.heroes objectAtIndex:indexPath.row];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HeroCell"];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.heroClass;
    return cell;
}

@end

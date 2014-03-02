#import "GCHerosListViewController.h"
#import "GCModels.h"

@interface GCHerosListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation GCHerosListViewController

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.heros count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GCHero *hero = [self.heros objectAtIndex:indexPath.row];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HeroCell"];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.heroClass;
    return cell;
}

@end

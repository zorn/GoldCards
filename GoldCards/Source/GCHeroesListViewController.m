#import "GCHeroesListViewController.h"
#import "GCModels.h"
#import "GCHeroListTableViewCell.h"

@interface GCHeroesListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation GCHeroesListViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.heroes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GCHero *hero = [self.heroes objectAtIndex:indexPath.row];
    GCHeroListTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HeroCell"];
    cell.nameLabel.text = hero.name;
    cell.heroClassLabel.text = hero.heroClass;
    cell.heroBackgroundImageView.hidden = YES;
    UIColor *imageAsColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"hero-row-background-%@", hero.remoteID]]];
    cell.contentView.backgroundColor = imageAsColor;
    UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
    myBackView.backgroundColor = [imageAsColor colorWithAlphaComponent:0.8];
    cell.selectedBackgroundView = myBackView;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

@end

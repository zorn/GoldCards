#import "GCHeroDetailViewController.h"
#import "GCModels.h"
#import "GCCardListViewController.h"
#import "AppDelegate.h"
#import "ZORNCoreDataStack.h"

@interface GCHeroDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *headerBackgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GCHeroDetailViewController

#pragma mark - UIViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - Private

- (void)updateUI
{
    self.title = self.hero.name;
    self.nameLabel.text = self.hero.name;
    self.classNameLabel.text = self.hero.heroClass;
    self.headerBackgroundImageView.image = [UIImage imageNamed:self.hero.heroDetailBackgroundImageName];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Basic"];
    cell.textLabel.text = @"Cards";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
        GCCardListViewController *vc = (GCCardListViewController *)[storyboard instantiateViewControllerWithIdentifier:@"GCCardListViewController"];
        NSAssert([vc isKindOfClass:[GCCardListViewController class]], @"???");
        ZORNCoreDataStack *coreDataStack = [(AppDelegate *)[[UIApplication sharedApplication] delegate] coreDataStack];
        vc.managedObjectContext = coreDataStack.managedObjectContext;
        vc.hero = self.hero;
        vc.title = [NSString stringWithFormat:@"%@ Cards", self.hero.heroClass];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end

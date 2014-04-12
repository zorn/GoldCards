#import "GCHeroDetailViewController.h"
#import "GCModels.h"

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

@end

#import "GCCardDetailViewController.h"
#import "GCModels.h"
#import "UIImage+animatedGIF.h"
#import "GCAudioPlayer.h"
#import "GGFullscreenImageViewController.h"

NS_ENUM(NSUInteger, CardDetailSections) {
    CardDetailSectionDescription = 0,
    CardDetailSectionStats,
    CardDetailSectionsCount
};

NS_ENUM(NSUInteger, CardDetailSectionDescriptionRows) {
    CardDetailSectionDescriptionRowDescription = 0,
    CardDetailSectionDescriptionRowsCount
};

@interface GCCardDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIImageView *cardImageView;
@property (assign, nonatomic) CGRect cachedCardImageViewSize;
@end

#define CARD_VERTICAL_ADJUUSTMENT -70.0f

@implementation GCCardDetailViewController

#pragma mark - UIViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.cardImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CARD_VERTICAL_ADJUUSTMENT, 320, 150)];
    self.cardImageView.contentMode = UIViewContentModeTop;
    self.cardImageView.clipsToBounds = YES;
    self.cardImageView.backgroundColor = [UIColor blackColor];
    self.cachedCardImageViewSize = self.cardImageView.frame;
    [self.tableView addSubview:self.cardImageView];
    [self.tableView sendSubviewToBack:self.cardImageView];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = self.card.name;
    NSURL *cardImageURL = [[NSBundle mainBundle] URLForResource:[self.card goldImageFilename] withExtension:@"gif"];
    self.cardImageView.image = [UIImage animatedImageWithAnimatedGIFURL:cardImageURL];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[GCAudioPlayer sharedInstance] playActivateEffectForCard:self.card];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[GCAudioPlayer sharedInstance] stop];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return CardDetailSectionsCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == CardDetailSectionDescription) {
        return CardDetailSectionDescriptionRowsCount;
    } else if (section == CardDetailSectionStats) {
        return [self statRowsForCard:self.card];
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == CardDetailSectionDescription) {
        return [self summaryCellForIndexPath:indexPath];
    } else if (indexPath.section == CardDetailSectionStats) {
        return [self statCellForIndexPath:indexPath];
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case CardDetailSectionDescription:
            return @"Description";
        case CardDetailSectionStats:
            return @"Stats";
    }
    return nil;
}

#pragma mark - UIScrollView

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = -scrollView.contentOffset.y;
    if (y > 0) {
        self.cardImageView.frame = CGRectMake(0, CARD_VERTICAL_ADJUUSTMENT + scrollView.contentOffset.y, self.cachedCardImageViewSize.size.width+y, self.cachedCardImageViewSize.size.height+y);
        self.cardImageView.center = CGPointMake(self.view.center.x, self.cardImageView.center.y);
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGFloat y = -scrollView.contentOffset.y;
    if (y > 60) {
        GGFullscreenImageViewController *vc = [[GGFullscreenImageViewController alloc] init];
        vc.liftedImageView = self.cardImageView;
        //vc.liftedImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self presentViewController:vc animated:YES completion:nil];
    }
}

#pragma mark - Private

- (NSInteger)statRowsForCard:(GCCard *)card
{
    NSInteger total = 0;
    if (card.cost) {
        total++;
    }
    if (card.attack) {
        total++;
    }
    if (card.health) {
        total++;
    }
    return total;
}

- (UITableViewCell *)summaryCellForIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"summaryCell"];
    cell.textLabel.text = self.card.summary;
    return cell;
}

- (UITableViewCell *)statCellForIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"statCell"];
    if (self.card.cost && indexPath.row <= 0) {
        cell.textLabel.text = @"Cost";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.card.cost];
        return cell;
    }
    if (self.card.attack && indexPath.row <= 1) {
        cell.textLabel.text = @"Attack";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.card.attack];
        return cell;
    }
    if (self.card.health && indexPath.row <= 2) {
        cell.textLabel.text = @"Health";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.card.health];
        return cell;
    }
    return nil;
}

@end

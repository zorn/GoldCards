#import "GCCardDetailViewController.h"
#import "GCModels.h"
#import "UIImage+animatedGIF.h"
#import "GCAudioPlayer.h"
#import "GGFullscreenImageViewController.h"
#import "GCCardDetailTableViewCell.h"

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
@property (assign) BOOL didPlaySoundEffect;
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
    if (!self.didPlaySoundEffect && [[NSUserDefaults standardUserDefaults] boolForKey:GCAudioPlayerShouldPlayActivateEffectOnCardBrowse]) {
        [[GCAudioPlayer sharedInstance] playActivateEffectForCard:self.card];
        self.didPlaySoundEffect = YES;
    }    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //[[GCAudioPlayer sharedInstance] stop];
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
            return @"Info";
        case CardDetailSectionStats:
            return @"Stats";
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == CardDetailSectionDescription) {
        GCCardDetailTableViewCell *cell = (GCCardDetailTableViewCell *)[self summaryCellForIndexPath:indexPath];
        
        // Set the width of the cell to match the width of the table view. This is important so that we'll get the
        // correct height for different table view widths, since our cell's height depends on its width due to
        // the multi-line UILabel word wrapping. Don't need to do this above in -[tableView:cellForRowAtIndexPath]
        // because it happens automatically when the cell is used in the table view.
        cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
        
        // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints
        // (Note that the preferredMaxLayoutWidth is set on multi-line UILabels inside the -[layoutSubviews] method
        // in the UITableViewCell subclass
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
        
        // Get the actual height required for the cell
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        
        // Add an extra point to the height to account for internal rounding errors that are occasionally observed in
        // the Auto Layout engine, which cause the returned height to be slightly too small in some cases.
        height += 1;
        
        return height;
    } else {
        return 44.0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0f;
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

- (GCCardDetailTableViewCell *)summaryCellForIndexPath:(NSIndexPath *)indexPath
{
    GCCardDetailTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"summaryCell"];
    NSAssert([cell isKindOfClass:[GCCardDetailTableViewCell class]], @"???");
    cell.cardDetailTextLabel.text = self.card.summary;
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

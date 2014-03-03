#import "GCCardDetailViewController.h"
#import "GCModels.h"
#import "UIImage+animatedGIF.h"

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
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;



@end

@implementation GCCardDetailViewController

#pragma mark - UIViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = self.card.name;
    NSURL *cardImageURL = [[NSBundle mainBundle] URLForResource:[self.card goldImageFilename] withExtension:@"gif"];
    self.cardImageView.image = [UIImage animatedImageWithAnimatedGIFURL:cardImageURL];
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

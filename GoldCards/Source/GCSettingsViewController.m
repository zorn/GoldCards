#import "GCSettingsViewController.h"
#import "GCAudioPlayer.h"

@interface GCSettingsViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *cardEntranceSoundSwitch;

@end

@implementation GCSettingsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (IBAction)switchAction:(id)sender
{
    if (sender == self.cardEntranceSoundSwitch) {
        [[NSUserDefaults standardUserDefaults] setBool:self.cardEntranceSoundSwitch.on forKey:GCAudioPlayerShouldPlayActivateEffectOnCardBrowse];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)updateUI
{
    self.cardEntranceSoundSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:GCAudioPlayerShouldPlayActivateEffectOnCardBrowse];
}

@end

#import "GCAudioPlayer.h"
#import <AVFoundation/AVFoundation.h>
#import "GCModels.h"

@interface GCAudioPlayer () <AVAudioPlayerDelegate>
@property (strong) AVAudioPlayer *player;
@end

@implementation GCAudioPlayer

+ (GCAudioPlayer *) sharedInstance
{
    static GCAudioPlayer *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GCAudioPlayer alloc] init];
    });
    return sharedInstance;
}

- (void)playActivateEffectForCard:(GCCard *)card
{
    NSString *filename = [NSString stringWithFormat:@"VO_%@_Play_01", card.imageFilename];
	[self playSoundWithFilename:filename andType:@"mp3"];
}

- (void)playSoundWithFilename:(NSString *)filename andType:(NSString *)type
{
    if (!self.player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:type];
        if (url) {
            self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            [self.player setDelegate:self];
            [self.player play];
        } else {
            DDLogError(@"Could not load: %@.%@", filename, type);
        }
    } else {
        DDLogError(@"Can't play %@.%@ -- there is already an active player", filename, type);
    }
}

#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (player == self.player) {
        self.player.delegate = nil;
        self.player = nil;
    }
}

@end

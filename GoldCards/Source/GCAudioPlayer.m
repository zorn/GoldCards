#import "GCAudioPlayer.h"
#import <AVFoundation/AVFoundation.h>
#import "GCModels.h"

NSString * const GCAudioPlayerShouldPlayActivateEffectOnCardBrowse = @"GCAudioPlayerShouldPlayActivateEffectOnCardBrowse";

@interface GCAudioPlayer () <AVAudioPlayerDelegate>
@property (strong) AVAudioPlayer *player;
@end

@implementation GCAudioPlayer

+ (void)initialize
{
    NSDictionary *defaults = @{GCAudioPlayerShouldPlayActivateEffectOnCardBrowse : @(NO)};
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
}

+ (GCAudioPlayer *) sharedInstance
{
    static GCAudioPlayer *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GCAudioPlayer alloc] init];
    });
    return sharedInstance;
}

- (BOOL)playActivateEffectForCard:(GCCard *)card
{
    NSString *filename = [NSString stringWithFormat:@"VO_%@_Play_01", card.imageFilename];
	return [self playSoundWithFilename:filename andType:@"mp3"];
}

- (BOOL)playDeathEffectForCard:(GCCard *)card
{
    NSString *filename = [NSString stringWithFormat:@"VO_%@_Death_01", card.imageFilename];
	return [self playSoundWithFilename:filename andType:@"mp3"];
}

- (BOOL)playAttackEffectForCard:(GCCard *)card
{
    NSString *filename = [NSString stringWithFormat:@"VO_%@_Attack_01", card.imageFilename];
	return [self playSoundWithFilename:filename andType:@"mp3"];
}

- (BOOL)playSoundWithFilename:(NSString *)filename andType:(NSString *)type
{
    if (!self.player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:type];
        if (url) {
            self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            [self.player setDelegate:self];
            [self.player play];
            return YES;
        } else {
            DDLogError(@"Could not load: %@.%@", filename, type);
        }
    } else {
        DDLogError(@"Can't play %@.%@ -- there is already an active player", filename, type);
    }
    return NO;
}

- (void)stop
{
    if (self.player) {
        self.player.delegate = nil;
        self.player = nil;
    }
}

#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (player == self.player) {
        [self stop];
    }
}

@end

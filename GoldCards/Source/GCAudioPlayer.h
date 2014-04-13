#import <Foundation/Foundation.h>

extern NSString * const GCAudioPlayerShouldPlayActivateEffectOnCardBrowse;

@class GCCard;

@interface GCAudioPlayer : NSObject

+ (GCAudioPlayer *) sharedInstance;
- (BOOL)playActivateEffectForCard:(GCCard *)card;
- (BOOL)playSoundWithFilename:(NSString *)filename andType:(NSString *)type;
- (void)stop;

@end

#import <Foundation/Foundation.h>

@class GCCard;

@interface GCAudioPlayer : NSObject

+ (GCAudioPlayer *) sharedInstance;
- (void)playActivateEffectForCard:(GCCard *)card;
- (void)playSoundWithFilename:(NSString *)filename andType:(NSString *)type;

@end

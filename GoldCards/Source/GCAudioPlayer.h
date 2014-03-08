#import <Foundation/Foundation.h>

@class GCCard;

@interface GCAudioPlayer : NSObject

+ (GCAudioPlayer *) sharedInstance;
- (BOOL)playActivateEffectForCard:(GCCard *)card;
- (BOOL)playSoundWithFilename:(NSString *)filename andType:(NSString *)type;
- (void)stop;

@end

#import <Foundation/Foundation.h>

@class ZORNCoreDataStack;

@interface GCCoreDataManager : NSObject

@property (strong) ZORNCoreDataStack *coreDataStack;

- (BOOL)initializeEmptyStore:(NSError **)error;
- (BOOL)isStoreEmpty;

@end

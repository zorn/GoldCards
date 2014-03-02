#import <Foundation/Foundation.h>

@class ZORNCoreDataStack;

@interface GCCoreDataManager : NSObject

@property (readonly) ZORNCoreDataStack *coreDataStack;

- (id)initWithCoreDataStack:(ZORNCoreDataStack *)coreDataStack;
- (BOOL)initializeEmptyStore:(NSError **)error;
- (BOOL)isStoreEmpty;

@end

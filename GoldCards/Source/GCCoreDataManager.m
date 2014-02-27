#import "GCCoreDataManager.h"
#import "GCModels.h"
#import "ZORNCoreDataStack.h"

@implementation GCCoreDataManager

- (BOOL)initializeEmptyStore:(NSError **)error
{
    if (![self isStoreEmpty]) {
        DDLogWarn(@"can't initializeEmptyStore since isStoreEmpty is NO");
    }
    
    NSError *importError = nil;
    if (![self importHeros:&importError]) {
        *error = importError;
        return NO;
    }
    
    [self.coreDataStack.managedObjectContext zorncds_saveForcefully];
    return YES;
}

- (BOOL)isStoreEmpty
{
    return ([GCCard td_countOfEntitiesInManagedObjectContext:self.coreDataStack.managedObjectContext] > 0);
}

#pragma mark - Private

- (BOOL)importHeros:(NSError **)error
{
    return NO;
}

@end

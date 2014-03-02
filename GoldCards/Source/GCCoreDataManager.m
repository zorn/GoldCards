#import "GCCoreDataManager.h"
#import "GCModels.h"
#import "ZORNCoreDataStack.h"
#import "ZORNJSONService.h"
#import "ZORNMappingService.h"

@interface NSError (GCCoreDataManagerAdditions)
+ (NSError *)gccdm_errorWithCode:(NSInteger)code message:(NSString *)message;
@end

@implementation NSError (GCCoreDataManagerAdditions)
+ (NSError *)gccdm_errorWithCode:(NSInteger)code message:(NSString *)message
{
    return [NSError errorWithDomain:@"com.mikezornek.goldcards.coredatamanager" code:code userInfo:@{NSLocalizedDescriptionKey: message}];
}
@end

@interface GCCoreDataManager ()
@property (strong) ZORNCoreDataStack *coreDataStack;
@end

@implementation GCCoreDataManager

- (id)initWithCoreDataStack:(ZORNCoreDataStack *)coreDataStack
{
    self = [super init];
    if (self) {
        self.coreDataStack = coreDataStack;
    }
    return self;
}

- (BOOL)initializeEmptyStore:(NSError **)returnError
{
    if (![self isStoreEmpty]) {
        *returnError = [NSError gccdm_errorWithCode:1 message:@"can't initialize an non-empty store"];
        DDLogError(@"error: %@", *returnError);
        return NO;
    }
    
    NSError *importError = nil;
    if (![self importHeroes:&importError]) {
        DDLogError(@"error: %@", importError);
        return NO;
    }
    
    [self.coreDataStack.managedObjectContext zorncds_saveForcefully];
    return YES;
}

- (BOOL)isStoreEmpty
{
    return ([GCHero td_countOfEntitiesInManagedObjectContext:self.coreDataStack.managedObjectContext] <= 0);
}

#pragma mark - Private

- (BOOL)importHeroes:(NSError **)returnError
{
    NSData *jsonData = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"heroes" withExtension:@"json"]];
    NSArray *heroes = [ZORNJSONService arrayForJSONData:jsonData];
    ZORNMappingService *mappingService = [[ZORNMappingService alloc] init];
    NSError *mappingError = nil;
    NSArray *mappedObjects = [mappingService mapDictionaryCollection:heroes
                                             toObjectInstanseOfClass:[GCHero class]
                                              inManagedObjectContext:self.coreDataStack.managedObjectContext
                                                       updateObjects:YES
                                                        usingMapping:[GCHero zorn_JSONToModelAttributeMapping]
                                           uniqueIdentifierAttribute:@"remoteID"
                                                  customMappingBlock:nil
                                                               error:&mappingError];
    if (!mappedObjects) {
        DDLogError(@"error mapping heroes: %@", mappingError);
        *returnError = mappingError;
        return NO;
    }
    return YES;
}

@end

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
    importError = nil;
    if (![self importCards:&importError]) {
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
    return [self importJSONAtURL:[[NSBundle mainBundle] URLForResource:@"heroes" withExtension:@"json"] mapToClass:[GCHero class] error:returnError];

}

- (BOOL)importCards:(NSError **)returnError
{
    return [self importJSONAtURL:[[NSBundle mainBundle] URLForResource:@"cards" withExtension:@"json"] mapToClass:[GCCard class] error:returnError];
}

- (BOOL)importJSONAtURL:(NSURL *)jsonURL mapToClass:(Class)someClass error:(NSError **)returnError
{
    NSData *jsonData = [NSData dataWithContentsOfURL:jsonURL];
    NSArray *objects = [ZORNJSONService arrayForJSONData:jsonData];
    ZORNMappingService *mappingService = [[ZORNMappingService alloc] init];
    NSError *mappingError = nil;
    NSArray *mappedObjects = [mappingService mapDictionaryCollection:objects
                                             toObjectInstanseOfClass:someClass
                                              inManagedObjectContext:self.coreDataStack.managedObjectContext
                                                       updateObjects:YES
                                                        usingMapping:[someClass zorn_JSONToModelAttributeMapping]
                                           uniqueIdentifierAttribute:@"remoteID"
                                                  customMappingBlock:nil
                                                               error:&mappingError];
    if (!mappedObjects) {
        DDLogError(@"error mapping: %@", mappingError);
        *returnError = mappingError;
        return NO;
    }
    return YES;
}

@end

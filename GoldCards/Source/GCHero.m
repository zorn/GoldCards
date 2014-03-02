#import "GCHero.h"
#import "NSManagedObject+ZORNCoreDataStackAdditions.h"

@implementation GCHero

+ (NSArray *)orderedHerosInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    NSArray *unorderdHeros = [GCHero zorncds_findAllInManagedObjectContext:managedObjectContext];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"remoteID" ascending:YES];
    return [unorderdHeros sortedArrayUsingDescriptors:@[sort]];
}

+ (NSDictionary *)zorn_JSONToModelAttributeMapping
{
    return @{@"remoteID": @"remoteID",
             @"heroClass": @"heroClass",
             @"name": @"name"};
}

@end

#import "GCHero.h"
#import "NSManagedObject+ZORNCoreDataStackAdditions.h"

@implementation GCHero

+ (NSArray *)orderedHeroesInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    NSArray *unorderdHeroes = [GCHero zorncds_findAllInManagedObjectContext:managedObjectContext];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"remoteID" ascending:YES];
    return [unorderdHeroes sortedArrayUsingDescriptors:@[sort]];
}

+ (NSDictionary *)zorn_JSONToModelAttributeMapping
{
    return @{@"remoteID": @"remoteID",
             @"heroClass": @"heroClass",
             @"name": @"name"};
}

@end

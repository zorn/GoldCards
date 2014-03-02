#import "_GCHero.h"

@interface GCHero : _GCHero {}

+ (NSArray *)orderedHeroesInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;
+ (NSDictionary *)zorn_JSONToModelAttributeMapping;

@end

#import "_GCHero.h"

@interface GCHero : _GCHero {}

+ (NSArray *)orderedHeroesInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;
+ (NSDictionary *)zorn_JSONToModelAttributeMapping;
+ (GCHero *)heroForCardClassValue:(NSNumber *)classValue inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

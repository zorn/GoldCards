#import "_GCHero.h"

@interface GCHero : _GCHero {}

+ (NSArray *)orderedHerosInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;
+ (NSDictionary *)zorn_JSONToModelAttributeMapping;

@end

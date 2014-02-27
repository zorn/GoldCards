// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCHero.m instead.

#import "_GCHero.h"

const struct GCHeroAttributes GCHeroAttributes = {
	.heroClass = @"heroClass",
	.name = @"name",
};

const struct GCHeroRelationships GCHeroRelationships = {
	.cards = @"cards",
};

const struct GCHeroFetchedProperties GCHeroFetchedProperties = {
};

@implementation GCHeroID
@end

@implementation _GCHero

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GCHero" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GCHero";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GCHero" inManagedObjectContext:moc_];
}

- (GCHeroID*)objectID {
	return (GCHeroID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic heroClass;






@dynamic name;






@dynamic cards;

	
- (NSMutableSet*)cardsSet {
	[self willAccessValueForKey:@"cards"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"cards"];
  
	[self didAccessValueForKey:@"cards"];
	return result;
}
	






@end

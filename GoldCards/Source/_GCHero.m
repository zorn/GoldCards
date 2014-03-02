// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCHero.m instead.

#import "_GCHero.h"

const struct GCHeroAttributes GCHeroAttributes = {
	.heroClass = @"heroClass",
	.name = @"name",
	.remoteID = @"remoteID",
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
	
	if ([key isEqualToString:@"remoteIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"remoteID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic heroClass;






@dynamic name;






@dynamic remoteID;



- (int16_t)remoteIDValue {
	NSNumber *result = [self remoteID];
	return [result shortValue];
}

- (void)setRemoteIDValue:(int16_t)value_ {
	[self setRemoteID:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRemoteIDValue {
	NSNumber *result = [self primitiveRemoteID];
	return [result shortValue];
}

- (void)setPrimitiveRemoteIDValue:(int16_t)value_ {
	[self setPrimitiveRemoteID:[NSNumber numberWithShort:value_]];
}





@dynamic cards;

	
- (NSMutableSet*)cardsSet {
	[self willAccessValueForKey:@"cards"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"cards"];
  
	[self didAccessValueForKey:@"cards"];
	return result;
}
	






@end

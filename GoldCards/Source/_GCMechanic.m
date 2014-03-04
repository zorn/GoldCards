// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCMechanic.m instead.

#import "_GCMechanic.h"

const struct GCMechanicAttributes GCMechanicAttributes = {
	.icon = @"icon",
	.name = @"name",
	.remoteID = @"remoteID",
	.summary = @"summary",
};

const struct GCMechanicRelationships GCMechanicRelationships = {
	.cards = @"cards",
};

const struct GCMechanicFetchedProperties GCMechanicFetchedProperties = {
};

@implementation GCMechanicID
@end

@implementation _GCMechanic

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GCMechanic" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GCMechanic";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GCMechanic" inManagedObjectContext:moc_];
}

- (GCMechanicID*)objectID {
	return (GCMechanicID*)[super objectID];
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




@dynamic icon;






@dynamic name;






@dynamic remoteID;



- (int64_t)remoteIDValue {
	NSNumber *result = [self remoteID];
	return [result longLongValue];
}

- (void)setRemoteIDValue:(int64_t)value_ {
	[self setRemoteID:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveRemoteIDValue {
	NSNumber *result = [self primitiveRemoteID];
	return [result longLongValue];
}

- (void)setPrimitiveRemoteIDValue:(int64_t)value_ {
	[self setPrimitiveRemoteID:[NSNumber numberWithLongLong:value_]];
}





@dynamic summary;






@dynamic cards;

	
- (NSMutableSet*)cardsSet {
	[self willAccessValueForKey:@"cards"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"cards"];
  
	[self didAccessValueForKey:@"cards"];
	return result;
}
	






@end

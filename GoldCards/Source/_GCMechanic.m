// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCMechanic.m instead.

#import "_GCMechanic.h"

const struct GCMechanicAttributes GCMechanicAttributes = {
};

const struct GCMechanicRelationships GCMechanicRelationships = {
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
	

	return keyPaths;
}









@end

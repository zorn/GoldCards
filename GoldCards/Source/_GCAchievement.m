// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCAchievement.m instead.

#import "_GCAchievement.h"

const struct GCAchievementAttributes GCAchievementAttributes = {
};

const struct GCAchievementRelationships GCAchievementRelationships = {
};

const struct GCAchievementFetchedProperties GCAchievementFetchedProperties = {
};

@implementation GCAchievementID
@end

@implementation _GCAchievement

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GCAchievement" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GCAchievement";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GCAchievement" inManagedObjectContext:moc_];
}

- (GCAchievementID*)objectID {
	return (GCAchievementID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}









@end

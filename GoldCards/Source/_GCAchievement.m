// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCAchievement.m instead.

#import "_GCAchievement.h"

const struct GCAchievementAttributes GCAchievementAttributes = {
	.achievementType = @"achievementType",
	.name = @"name",
	.remoteID = @"remoteID",
	.reward = @"reward",
	.rewardType = @"rewardType",
	.summary = @"summary",
	.trigger = @"trigger",
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
	
	if ([key isEqualToString:@"remoteIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"remoteID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic achievementType;






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





@dynamic reward;






@dynamic rewardType;






@dynamic summary;






@dynamic trigger;











@end

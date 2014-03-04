// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCQuest.m instead.

#import "_GCQuest.h"

const struct GCQuestAttributes GCQuestAttributes = {
	.name = @"name",
	.questType = @"questType",
	.remoteID = @"remoteID",
	.reward = @"reward",
	.rewardType = @"rewardType",
	.summary = @"summary",
	.trigger = @"trigger",
};

const struct GCQuestRelationships GCQuestRelationships = {
};

const struct GCQuestFetchedProperties GCQuestFetchedProperties = {
};

@implementation GCQuestID
@end

@implementation _GCQuest

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GCQuest" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GCQuest";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GCQuest" inManagedObjectContext:moc_];
}

- (GCQuestID*)objectID {
	return (GCQuestID*)[super objectID];
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




@dynamic name;






@dynamic questType;






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

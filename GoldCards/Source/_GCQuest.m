// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCQuest.m instead.

#import "_GCQuest.h"

const struct GCQuestAttributes GCQuestAttributes = {
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
	

	return keyPaths;
}









@end

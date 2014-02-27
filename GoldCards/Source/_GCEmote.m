// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCEmote.m instead.

#import "_GCEmote.h"

const struct GCEmoteAttributes GCEmoteAttributes = {
};

const struct GCEmoteRelationships GCEmoteRelationships = {
};

const struct GCEmoteFetchedProperties GCEmoteFetchedProperties = {
};

@implementation GCEmoteID
@end

@implementation _GCEmote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GCEmote" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GCEmote";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GCEmote" inManagedObjectContext:moc_];
}

- (GCEmoteID*)objectID {
	return (GCEmoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}









@end

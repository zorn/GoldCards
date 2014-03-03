// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCCard.m instead.

#import "_GCCard.h"

const struct GCCardAttributes GCCardAttributes = {
	.attack = @"attack",
	.cardTypeAsNumber = @"cardTypeAsNumber",
	.cost = @"cost",
	.factionAsNumber = @"factionAsNumber",
	.health = @"health",
	.iconFilename = @"iconFilename",
	.imageFilename = @"imageFilename",
	.isCollectable = @"isCollectable",
	.isElite = @"isElite",
	.name = @"name",
	.qualityAsNumber = @"qualityAsNumber",
	.remoteID = @"remoteID",
	.setAsNumber = @"setAsNumber",
	.summary = @"summary",
};

const struct GCCardRelationships GCCardRelationships = {
	.hero = @"hero",
};

const struct GCCardFetchedProperties GCCardFetchedProperties = {
};

@implementation GCCardID
@end

@implementation _GCCard

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GCCard" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GCCard";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GCCard" inManagedObjectContext:moc_];
}

- (GCCardID*)objectID {
	return (GCCardID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"attackValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"attack"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"cardTypeAsNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"cardTypeAsNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"costValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"cost"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"factionAsNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"factionAsNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"healthValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"health"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"isCollectableValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isCollectable"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"isEliteValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isElite"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"qualityAsNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"qualityAsNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"remoteIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"remoteID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"setAsNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"setAsNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic attack;



- (int16_t)attackValue {
	NSNumber *result = [self attack];
	return [result shortValue];
}

- (void)setAttackValue:(int16_t)value_ {
	[self setAttack:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveAttackValue {
	NSNumber *result = [self primitiveAttack];
	return [result shortValue];
}

- (void)setPrimitiveAttackValue:(int16_t)value_ {
	[self setPrimitiveAttack:[NSNumber numberWithShort:value_]];
}





@dynamic cardTypeAsNumber;



- (int16_t)cardTypeAsNumberValue {
	NSNumber *result = [self cardTypeAsNumber];
	return [result shortValue];
}

- (void)setCardTypeAsNumberValue:(int16_t)value_ {
	[self setCardTypeAsNumber:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveCardTypeAsNumberValue {
	NSNumber *result = [self primitiveCardTypeAsNumber];
	return [result shortValue];
}

- (void)setPrimitiveCardTypeAsNumberValue:(int16_t)value_ {
	[self setPrimitiveCardTypeAsNumber:[NSNumber numberWithShort:value_]];
}





@dynamic cost;



- (int16_t)costValue {
	NSNumber *result = [self cost];
	return [result shortValue];
}

- (void)setCostValue:(int16_t)value_ {
	[self setCost:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveCostValue {
	NSNumber *result = [self primitiveCost];
	return [result shortValue];
}

- (void)setPrimitiveCostValue:(int16_t)value_ {
	[self setPrimitiveCost:[NSNumber numberWithShort:value_]];
}





@dynamic factionAsNumber;



- (int16_t)factionAsNumberValue {
	NSNumber *result = [self factionAsNumber];
	return [result shortValue];
}

- (void)setFactionAsNumberValue:(int16_t)value_ {
	[self setFactionAsNumber:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveFactionAsNumberValue {
	NSNumber *result = [self primitiveFactionAsNumber];
	return [result shortValue];
}

- (void)setPrimitiveFactionAsNumberValue:(int16_t)value_ {
	[self setPrimitiveFactionAsNumber:[NSNumber numberWithShort:value_]];
}





@dynamic health;



- (int16_t)healthValue {
	NSNumber *result = [self health];
	return [result shortValue];
}

- (void)setHealthValue:(int16_t)value_ {
	[self setHealth:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveHealthValue {
	NSNumber *result = [self primitiveHealth];
	return [result shortValue];
}

- (void)setPrimitiveHealthValue:(int16_t)value_ {
	[self setPrimitiveHealth:[NSNumber numberWithShort:value_]];
}





@dynamic iconFilename;






@dynamic imageFilename;






@dynamic isCollectable;



- (BOOL)isCollectableValue {
	NSNumber *result = [self isCollectable];
	return [result boolValue];
}

- (void)setIsCollectableValue:(BOOL)value_ {
	[self setIsCollectable:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsCollectableValue {
	NSNumber *result = [self primitiveIsCollectable];
	return [result boolValue];
}

- (void)setPrimitiveIsCollectableValue:(BOOL)value_ {
	[self setPrimitiveIsCollectable:[NSNumber numberWithBool:value_]];
}





@dynamic isElite;



- (BOOL)isEliteValue {
	NSNumber *result = [self isElite];
	return [result boolValue];
}

- (void)setIsEliteValue:(BOOL)value_ {
	[self setIsElite:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsEliteValue {
	NSNumber *result = [self primitiveIsElite];
	return [result boolValue];
}

- (void)setPrimitiveIsEliteValue:(BOOL)value_ {
	[self setPrimitiveIsElite:[NSNumber numberWithBool:value_]];
}





@dynamic name;






@dynamic qualityAsNumber;



- (int16_t)qualityAsNumberValue {
	NSNumber *result = [self qualityAsNumber];
	return [result shortValue];
}

- (void)setQualityAsNumberValue:(int16_t)value_ {
	[self setQualityAsNumber:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveQualityAsNumberValue {
	NSNumber *result = [self primitiveQualityAsNumber];
	return [result shortValue];
}

- (void)setPrimitiveQualityAsNumberValue:(int16_t)value_ {
	[self setPrimitiveQualityAsNumber:[NSNumber numberWithShort:value_]];
}





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





@dynamic setAsNumber;



- (int16_t)setAsNumberValue {
	NSNumber *result = [self setAsNumber];
	return [result shortValue];
}

- (void)setSetAsNumberValue:(int16_t)value_ {
	[self setSetAsNumber:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveSetAsNumberValue {
	NSNumber *result = [self primitiveSetAsNumber];
	return [result shortValue];
}

- (void)setPrimitiveSetAsNumberValue:(int16_t)value_ {
	[self setPrimitiveSetAsNumber:[NSNumber numberWithShort:value_]];
}





@dynamic summary;






@dynamic hero;

	






@end

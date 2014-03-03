// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCCard.h instead.

#import <CoreData/CoreData.h>


extern const struct GCCardAttributes {
	__unsafe_unretained NSString *attack;
	__unsafe_unretained NSString *cardTypeAsNumber;
	__unsafe_unretained NSString *cost;
	__unsafe_unretained NSString *factionAsNumber;
	__unsafe_unretained NSString *health;
	__unsafe_unretained NSString *iconFilename;
	__unsafe_unretained NSString *imageFilename;
	__unsafe_unretained NSString *isCollectable;
	__unsafe_unretained NSString *isElite;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *qualityAsNumber;
	__unsafe_unretained NSString *remoteID;
	__unsafe_unretained NSString *setAsNumber;
	__unsafe_unretained NSString *summary;
} GCCardAttributes;

extern const struct GCCardRelationships {
	__unsafe_unretained NSString *hero;
} GCCardRelationships;

extern const struct GCCardFetchedProperties {
} GCCardFetchedProperties;

@class GCHero;
















@interface GCCardID : NSManagedObjectID {}
@end

@interface _GCCard : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GCCardID*)objectID;





@property (nonatomic, strong) NSNumber* attack;



@property int16_t attackValue;
- (int16_t)attackValue;
- (void)setAttackValue:(int16_t)value_;

//- (BOOL)validateAttack:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* cardTypeAsNumber;



@property int16_t cardTypeAsNumberValue;
- (int16_t)cardTypeAsNumberValue;
- (void)setCardTypeAsNumberValue:(int16_t)value_;

//- (BOOL)validateCardTypeAsNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* cost;



@property int16_t costValue;
- (int16_t)costValue;
- (void)setCostValue:(int16_t)value_;

//- (BOOL)validateCost:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* factionAsNumber;



@property int16_t factionAsNumberValue;
- (int16_t)factionAsNumberValue;
- (void)setFactionAsNumberValue:(int16_t)value_;

//- (BOOL)validateFactionAsNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* health;



@property int16_t healthValue;
- (int16_t)healthValue;
- (void)setHealthValue:(int16_t)value_;

//- (BOOL)validateHealth:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* iconFilename;



//- (BOOL)validateIconFilename:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageFilename;



//- (BOOL)validateImageFilename:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* isCollectable;



@property BOOL isCollectableValue;
- (BOOL)isCollectableValue;
- (void)setIsCollectableValue:(BOOL)value_;

//- (BOOL)validateIsCollectable:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* isElite;



@property BOOL isEliteValue;
- (BOOL)isEliteValue;
- (void)setIsEliteValue:(BOOL)value_;

//- (BOOL)validateIsElite:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* qualityAsNumber;



@property int16_t qualityAsNumberValue;
- (int16_t)qualityAsNumberValue;
- (void)setQualityAsNumberValue:(int16_t)value_;

//- (BOOL)validateQualityAsNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* remoteID;



@property int64_t remoteIDValue;
- (int64_t)remoteIDValue;
- (void)setRemoteIDValue:(int64_t)value_;

//- (BOOL)validateRemoteID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* setAsNumber;



@property int16_t setAsNumberValue;
- (int16_t)setAsNumberValue;
- (void)setSetAsNumberValue:(int16_t)value_;

//- (BOOL)validateSetAsNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* summary;



//- (BOOL)validateSummary:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) GCHero *hero;

//- (BOOL)validateHero:(id*)value_ error:(NSError**)error_;





@end

@interface _GCCard (CoreDataGeneratedAccessors)

@end

@interface _GCCard (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAttack;
- (void)setPrimitiveAttack:(NSNumber*)value;

- (int16_t)primitiveAttackValue;
- (void)setPrimitiveAttackValue:(int16_t)value_;




- (NSNumber*)primitiveCardTypeAsNumber;
- (void)setPrimitiveCardTypeAsNumber:(NSNumber*)value;

- (int16_t)primitiveCardTypeAsNumberValue;
- (void)setPrimitiveCardTypeAsNumberValue:(int16_t)value_;




- (NSNumber*)primitiveCost;
- (void)setPrimitiveCost:(NSNumber*)value;

- (int16_t)primitiveCostValue;
- (void)setPrimitiveCostValue:(int16_t)value_;




- (NSNumber*)primitiveFactionAsNumber;
- (void)setPrimitiveFactionAsNumber:(NSNumber*)value;

- (int16_t)primitiveFactionAsNumberValue;
- (void)setPrimitiveFactionAsNumberValue:(int16_t)value_;




- (NSNumber*)primitiveHealth;
- (void)setPrimitiveHealth:(NSNumber*)value;

- (int16_t)primitiveHealthValue;
- (void)setPrimitiveHealthValue:(int16_t)value_;




- (NSString*)primitiveIconFilename;
- (void)setPrimitiveIconFilename:(NSString*)value;




- (NSString*)primitiveImageFilename;
- (void)setPrimitiveImageFilename:(NSString*)value;




- (NSNumber*)primitiveIsCollectable;
- (void)setPrimitiveIsCollectable:(NSNumber*)value;

- (BOOL)primitiveIsCollectableValue;
- (void)setPrimitiveIsCollectableValue:(BOOL)value_;




- (NSNumber*)primitiveIsElite;
- (void)setPrimitiveIsElite:(NSNumber*)value;

- (BOOL)primitiveIsEliteValue;
- (void)setPrimitiveIsEliteValue:(BOOL)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveQualityAsNumber;
- (void)setPrimitiveQualityAsNumber:(NSNumber*)value;

- (int16_t)primitiveQualityAsNumberValue;
- (void)setPrimitiveQualityAsNumberValue:(int16_t)value_;




- (NSNumber*)primitiveRemoteID;
- (void)setPrimitiveRemoteID:(NSNumber*)value;

- (int64_t)primitiveRemoteIDValue;
- (void)setPrimitiveRemoteIDValue:(int64_t)value_;




- (NSNumber*)primitiveSetAsNumber;
- (void)setPrimitiveSetAsNumber:(NSNumber*)value;

- (int16_t)primitiveSetAsNumberValue;
- (void)setPrimitiveSetAsNumberValue:(int16_t)value_;




- (NSString*)primitiveSummary;
- (void)setPrimitiveSummary:(NSString*)value;





- (GCHero*)primitiveHero;
- (void)setPrimitiveHero:(GCHero*)value;


@end

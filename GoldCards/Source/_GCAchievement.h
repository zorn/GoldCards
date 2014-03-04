// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCAchievement.h instead.

#import <CoreData/CoreData.h>


extern const struct GCAchievementAttributes {
	__unsafe_unretained NSString *achievementType;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *remoteID;
	__unsafe_unretained NSString *reward;
	__unsafe_unretained NSString *rewardType;
	__unsafe_unretained NSString *summary;
	__unsafe_unretained NSString *trigger;
} GCAchievementAttributes;

extern const struct GCAchievementRelationships {
} GCAchievementRelationships;

extern const struct GCAchievementFetchedProperties {
} GCAchievementFetchedProperties;










@interface GCAchievementID : NSManagedObjectID {}
@end

@interface _GCAchievement : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GCAchievementID*)objectID;





@property (nonatomic, strong) NSString* achievementType;



//- (BOOL)validateAchievementType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* remoteID;



@property int64_t remoteIDValue;
- (int64_t)remoteIDValue;
- (void)setRemoteIDValue:(int64_t)value_;

//- (BOOL)validateRemoteID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* reward;



//- (BOOL)validateReward:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* rewardType;



//- (BOOL)validateRewardType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* summary;



//- (BOOL)validateSummary:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* trigger;



//- (BOOL)validateTrigger:(id*)value_ error:(NSError**)error_;






@end

@interface _GCAchievement (CoreDataGeneratedAccessors)

@end

@interface _GCAchievement (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAchievementType;
- (void)setPrimitiveAchievementType:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveRemoteID;
- (void)setPrimitiveRemoteID:(NSNumber*)value;

- (int64_t)primitiveRemoteIDValue;
- (void)setPrimitiveRemoteIDValue:(int64_t)value_;




- (NSString*)primitiveReward;
- (void)setPrimitiveReward:(NSString*)value;




- (NSString*)primitiveRewardType;
- (void)setPrimitiveRewardType:(NSString*)value;




- (NSString*)primitiveSummary;
- (void)setPrimitiveSummary:(NSString*)value;




- (NSString*)primitiveTrigger;
- (void)setPrimitiveTrigger:(NSString*)value;




@end

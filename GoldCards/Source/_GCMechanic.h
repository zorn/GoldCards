// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCMechanic.h instead.

#import <CoreData/CoreData.h>


extern const struct GCMechanicAttributes {
	__unsafe_unretained NSString *icon;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *remoteID;
	__unsafe_unretained NSString *summary;
} GCMechanicAttributes;

extern const struct GCMechanicRelationships {
	__unsafe_unretained NSString *cards;
} GCMechanicRelationships;

extern const struct GCMechanicFetchedProperties {
} GCMechanicFetchedProperties;

@class GCCard;






@interface GCMechanicID : NSManagedObjectID {}
@end

@interface _GCMechanic : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GCMechanicID*)objectID;





@property (nonatomic, strong) NSString* icon;



//- (BOOL)validateIcon:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* remoteID;



@property int64_t remoteIDValue;
- (int64_t)remoteIDValue;
- (void)setRemoteIDValue:(int64_t)value_;

//- (BOOL)validateRemoteID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* summary;



//- (BOOL)validateSummary:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *cards;

- (NSMutableSet*)cardsSet;





@end

@interface _GCMechanic (CoreDataGeneratedAccessors)

- (void)addCards:(NSSet*)value_;
- (void)removeCards:(NSSet*)value_;
- (void)addCardsObject:(GCCard*)value_;
- (void)removeCardsObject:(GCCard*)value_;

@end

@interface _GCMechanic (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveIcon;
- (void)setPrimitiveIcon:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveRemoteID;
- (void)setPrimitiveRemoteID:(NSNumber*)value;

- (int64_t)primitiveRemoteIDValue;
- (void)setPrimitiveRemoteIDValue:(int64_t)value_;




- (NSString*)primitiveSummary;
- (void)setPrimitiveSummary:(NSString*)value;





- (NSMutableSet*)primitiveCards;
- (void)setPrimitiveCards:(NSMutableSet*)value;


@end

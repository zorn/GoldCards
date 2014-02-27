// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GCHero.h instead.

#import <CoreData/CoreData.h>


extern const struct GCHeroAttributes {
	__unsafe_unretained NSString *heroClass;
	__unsafe_unretained NSString *name;
} GCHeroAttributes;

extern const struct GCHeroRelationships {
	__unsafe_unretained NSString *cards;
} GCHeroRelationships;

extern const struct GCHeroFetchedProperties {
} GCHeroFetchedProperties;

@class GCCard;




@interface GCHeroID : NSManagedObjectID {}
@end

@interface _GCHero : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GCHeroID*)objectID;





@property (nonatomic, strong) NSString* heroClass;



//- (BOOL)validateHeroClass:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *cards;

- (NSMutableSet*)cardsSet;





@end

@interface _GCHero (CoreDataGeneratedAccessors)

- (void)addCards:(NSSet*)value_;
- (void)removeCards:(NSSet*)value_;
- (void)addCardsObject:(GCCard*)value_;
- (void)removeCardsObject:(GCCard*)value_;

@end

@interface _GCHero (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveHeroClass;
- (void)setPrimitiveHeroClass:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveCards;
- (void)setPrimitiveCards:(NSMutableSet*)value;


@end

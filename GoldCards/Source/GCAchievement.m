#import "GCAchievement.h"


@interface GCAchievement ()

// Private interface goes here.

@end


@implementation GCAchievement

+ (NSDictionary *)zorn_JSONToModelAttributeMapping
{
    // Leaving the fields we are not importing commented out
    return @{
             @"description": @"summary",
             @"id": @"remoteID",
             //@"maxprogress": "1",
             @"name": @"name",
             //@"race": "0",
             @"reward": @"rewardValue",
             //@"rewarddata": "0",
             @"rewardtype": @"rewardType",
             @"trigger": @"trigger",
             @"type": @"achievementType"
             };
}

@end

#import "GCQuest.h"


@interface GCQuest ()

// Private interface goes here.

@end


@implementation GCQuest

+ (NSDictionary *)zorn_JSONToModelAttributeMapping
{
    return @{@"description": @"summary",
             @"id": @"remoteID",
             //"maxprogress": "2",
             @"name": @"name",
             //"race": "0",
             @"reward": @"reward",
             //"rewarddata": "0",
             @"rewardtype": @"rewardType",
             @"trigger": @"trigger",
             @"type": @"questType"
             };
}

@end

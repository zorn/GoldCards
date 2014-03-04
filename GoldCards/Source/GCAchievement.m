#import "GCAchievement.h"


@interface GCAchievement ()

// Private interface goes here.

@end


@implementation GCAchievement

+ (NSDictionary *)zorn_JSONToModelAttributeMapping
{
    return @{@"description": @"summary",
             @"id": @"remoteID",
             @"name": @"name",
             };
}

@end

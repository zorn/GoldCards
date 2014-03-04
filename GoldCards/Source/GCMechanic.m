#import "GCMechanic.h"


@interface GCMechanic ()

// Private interface goes here.

@end


@implementation GCMechanic

+ (NSDictionary *)zorn_JSONToModelAttributeMapping
{
    return @{
             @"description": @"summary",
             @"icon": @"icon",
             @"id": @"remoteID",
             @"name": @"name"
             };
}

@end

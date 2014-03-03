#import "GCCard.h"


@interface GCCard ()

// Private interface goes here.

@end


@implementation GCCard

+ (NSDictionary *)zorn_JSONToModelAttributeMapping
{
    return @{@"attack": @"attack",
             @"collectible": @"isCollectable",
             @"cost": @"cost",
             @"description": @"summary",
             @"elite": @"isElite",
             @"faction": @"factionAsNumber",
             @"health": @"health",
             @"icon": @"iconFilename",
             @"id": @"remoteID",
             @"image": @"imageFilename",
             @"name": @"name",
             @"quality": @"qualityAsNumber",
             @"set": @"setAsNumber",
             @"type": @"cardTypeAsNumber"};
}

@end

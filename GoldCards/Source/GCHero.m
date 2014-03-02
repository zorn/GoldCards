#import "GCHero.h"

@implementation GCHero

+ (NSDictionary *)zorn_JSONToModelAttributeMapping
{
    return @{@"remoteID": @"remoteID",
             @"heroClass": @"heroClass",
             @"name": @"name"};
}

@end

//
//  Events.m
//  Giftery
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Events.h"

@implementation Events
@synthesize strName,strOccasion,strDate,isGifted;

- (instancetype)initWithDictionary:(NSDictionary*)eventsDictionary {
    self = [super init];
    if (!self) { return nil; }
    // Properties associated with Events object.
    self.strName = eventsDictionary[@"Name"];
    self.strOccasion = eventsDictionary[@"Occasion"];
    self.strDate = eventsDictionary[@"Date"];
    self.isGifted = [eventsDictionary[@"Gifted"] boolValue];
    return self;
}

// Custom description for our JKUser object.
- (NSString*)description {
    return [NSString stringWithFormat:@"%@\n%@\n%@\n%d", self.strName, self.strOccasion, self.strDate,self.isGifted];
}

@end

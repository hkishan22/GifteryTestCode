//
//  GifteryAPI.m
//  Giftery
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#import "GifteryAPI.h"
#import "Utils.h"

@implementation GifteryAPI


// We create a singleton shareAPIManager to handle all out API interactions.
+ (instancetype)sharedAPIManager {
    static GifteryAPI* shareAPI = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareAPI = [[GifteryAPI alloc] init];
    });
    return shareAPI;
}

// We make (dummy) API call and assume API gives us all the Events  back in form of JSON.
- (NSArray*)getEventsJsonArray {

    NSData *jsonData = [Utils getEventsJson];
    
    NSError *jsonError;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&jsonError];
    if(jsonError) {
        // check the error description
        NSLog(@"json error : %@", [jsonError localizedDescription]);
    }
    
    return jsonArray;
}

@end


//
//  EventsViewModel.m
//  Giftery
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#import "EventsViewModel.h"
#import "GifteryAPI.h"
#import "Events.h"


@implementation EventsViewModel


- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    return self;
}

-(NSArray *)getEventsModel{
    
    NSArray *arrJson = [[GifteryAPI sharedAPIManager] getEventsJsonArray];
    
    NSMutableArray *arrEvents = [NSMutableArray array];
    for (NSDictionary *dict in arrJson) {
        Events *event = [[Events alloc]initWithDictionary:dict];
        [arrEvents addObject:event];
    }
    
    return  arrEvents;
}

@end

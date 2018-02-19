//
//  GifteryAPI.h
//  Giftery
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GifteryAPI : NSObject

+ (instancetype)sharedAPIManager;
- (NSArray*)getEventsJsonArray;
@end

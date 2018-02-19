//
//  Utils.h
//  Giftery
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject

+(NSData *)getEventsJson ;
+(NSString *)getRemainingDayString:(NSString *)refDate;
+(NSString *)getDateString:(NSString *)refDate;
+(UIColor*)colorWithHexString:(NSString*)hex;
+(void)setNavigationAndStatusBarStyle;
+(void)setTabBarStyle;
@end

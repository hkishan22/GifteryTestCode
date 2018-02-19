//
//  Utils.m
//  Giftery
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#import "Utils.h"

@implementation Utils



 +(NSData *)getEventsJson {
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePath = [mainBundle pathForResource:@"jsonresponse" ofType:@"txt"];
    NSError *error;
    
     NSData *data = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
     
     if (error != nil) {
         return  nil;
     }
    return data;

}


+ (NSInteger)numberOfDaysUntil:(NSDate *)aDate {
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:aDate options:0];
    
    return [components day];
}

+ (NSInteger)numberOfMonthsUntil:(NSDate *)aDate {
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitMonth fromDate:[NSDate date] toDate:aDate options:0];
    
    return [components month];
}

+(NSString *)getRemainingDayString:(NSString *)refDate {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YYYY-MM-dd"];
    
    NSDate *date = [dateFormat dateFromString:refDate];
    
    NSInteger days = [Utils numberOfDaysUntil:date];
    
    if (days > 40) {
        return [NSString stringWithFormat:@"in %ld months",(long)[Utils numberOfMonthsUntil:date]];
    }else if (days < 0){
        return [NSString stringWithFormat:@"in 0 days"];
    }
    else{
        return [NSString stringWithFormat:@"in %ld days",(long)days];
    }
    
    return @"";
    
}




+(NSString *)getDateString:(NSString *)refDate {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YYYY-MM-dd"];
    
    NSDate *date = [dateFormat dateFromString:refDate];
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"dd MMM"];
    
    return [[dateFormat1 stringFromDate:date] uppercaseString];


}


+(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+(void)setNavigationAndStatusBarStyle{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTranslucent:YES];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName: [Utils colorWithHexString:@"8c6b74"]}];
    


    
    id statusBarWindow = [[UIApplication sharedApplication] valueForKey:@"statusBarWindow"];
    id statusBar = [statusBarWindow valueForKey:@"statusBar"];
    
    SEL setForegroundColor_sel = NSSelectorFromString(@"setForegroundColor:");
    if([statusBar respondsToSelector:setForegroundColor_sel]) {
        // iOS 7+
        [statusBar performSelector:setForegroundColor_sel withObject:[Utils colorWithHexString:@"8c6b74"]];
    }
}

+(void)setTabBarStyle{
   // [[UITabBar appearance] setBackgroundColor:[Utils colorWithHexString:@"8c6c75"]];
    [[UITabBar appearance] setBarTintColor:[Utils colorWithHexString:@"8c6c75"]];
    [[UITabBar appearance] setTintColor:[Utils colorWithHexString:@"85bcbd"]];
    [[UITabBar appearance] setUnselectedItemTintColor:[UIColor whiteColor]];
}

@end

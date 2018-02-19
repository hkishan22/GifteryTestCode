//
//  Events.h
//  Giftery
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#ifndef Events_h
#define Events_h


#endif /* Events_h */

#import <UIKit/UIKit.h>

@interface Events : NSObject {
    
    NSString *strName ;
    NSString *strOccasion ;
    NSString *strDate ;
    BOOL isGifted ;
}

@property(strong,nonatomic) NSString *strName ;
@property(strong,nonatomic) NSString *strOccasion ;
@property(strong,nonatomic) NSString *strDate ;
@property(assign,nonatomic) BOOL isGifted ;

- (instancetype)initWithDictionary:(NSDictionary*)eventsDictionary;

@end

//
//  EventCellTableViewCell.h
//  Giftery
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCellTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel* lblName;
@property (strong, nonatomic) IBOutlet UILabel* lblOccasion;
@property (strong, nonatomic) IBOutlet UILabel* lblDate;
@property (strong, nonatomic) IBOutlet UILabel* lblRemainingDays;
@property (strong, nonatomic) IBOutlet UIButton* btnGift;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint* centreContraint;


-(void)setGiftTitle:(BOOL)isGifted ;
-(void)setBgColor:(BOOL)isGifted;
-(void)setOccasionLabelConstrain:(NSString *)name;
-(void)setDateTextColor:(BOOL)isGifted;
@end

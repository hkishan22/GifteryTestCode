//
//  EventCellTableViewCell.m
//  Giftery
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#import "EventCellTableViewCell.h"
#import "Utils.h"

@implementation EventCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)setGiftTitle:(BOOL)isGifted {
    if (isGifted) {
        [self.btnGift setTitle:@"" forState:UIControlStateNormal];
        [self.btnGift setImage:[UIImage imageNamed:@"icon5"] forState:UIControlStateNormal];
    }else{
        [self.btnGift setTitle:@"GIFT" forState:UIControlStateNormal];
        [self.btnGift setImage:nil forState:UIControlStateNormal];
    }
}

-(void)setBgColor:(BOOL)isGifted {
    if (isGifted) {
        [self.contentView setBackgroundColor:[UIColor colorWithRed:218.0/255.0 green:210.0/255.0 blue:213.0/255.0 alpha:1.0]];
    }else{
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
    }
}

-(void)setOccasionLabelConstrain:(NSString *)name{
    
     UIFont *font = self.lblOccasion.font;
    if (name.length == 0 ){
        self.centreContraint.constant = 0.0;
        [self.lblOccasion setFont:[font fontWithSize:20]];
        [self.lblOccasion setTextColor:[Utils colorWithHexString:@"8c6b74"]];

    }else{
        self.centreContraint.constant = 11.0;
        [self.lblOccasion setFont:[font fontWithSize:14]];
        [self.lblOccasion setTextColor:[Utils colorWithHexString:@"939598"]];
    }
}


-(void)setDateTextColor:(BOOL)isGifted {
    if (isGifted) {
        [self.lblDate setTextColor:[Utils colorWithHexString:@"939598"]];
        [self.lblName setTextColor:[Utils colorWithHexString:@"939598"]];
        [self.lblRemainingDays setTextColor:[Utils colorWithHexString:@"939598"]];

    }else{
        [self.lblDate setTextColor:[Utils colorWithHexString:@"8c6b74"]];
        [self.lblName setTextColor:[Utils colorWithHexString:@"8c6b74"]];
        [self.lblRemainingDays setTextColor:[Utils colorWithHexString:@"f58d89"]];

    }
}


@end

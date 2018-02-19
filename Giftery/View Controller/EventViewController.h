//
//  EventViewController.h
//  Giftery
//
//  Created by admin on 17/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventsViewModel.h"
@interface EventViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {

}

@property (nonatomic, strong)IBOutlet  UITableView* tableViewEvents;
@property (nonatomic, strong) EventsViewModel* viewModel;
@property (nonatomic, strong) NSArray* arrEvents;


- (instancetype)initWithViewModel:(EventsViewModel *)viewModel;
-(IBAction)btnAddClicked:(id)sender;
@end


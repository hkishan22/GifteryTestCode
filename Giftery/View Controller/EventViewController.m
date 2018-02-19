//
//  EventViewController.m
//  Giftery
//
//  Created by admin on 17/02/18.
//  Copyright © 2018 Hari Kishan Upadhyay. All rights reserved.
//

#import "EventViewController.h"
#import "EventCellTableViewCell.h"
#import "Events.h"
#import "Utils.h"
#import <QuartzCore/QuartzCore.h>

@interface EventViewController () {
}

@end

@implementation EventViewController
@synthesize viewModel,arrEvents;


- (instancetype)initWithViewModel:(EventsViewModel *)viewModel {
    self = [super initWithNibName:nil bundle:nil];
    if (!self) { return nil; }
    
    self.viewModel = viewModel;
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationItem.title = @"Your Events";
    if (self.viewModel == nil) {
        self.viewModel  = [[EventsViewModel alloc] init];
    }
    
    self.arrEvents = [self.viewModel getEventsModel];
    
    [self.tableViewEvents reloadData];
}


#pragma mark - UITableViewDataSource
// number of section(s)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return self.arrEvents.count;
}

// number of row in the section
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.; // you can have your own choice, of course
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}




// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"EventCellTableViewCell";
    
    Events *event = [self.arrEvents objectAtIndex:indexPath.section];
    
    EventCellTableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSLog(@"%@",event);
    cell.lblName.text = event.strName;
    cell.lblOccasion.text = event.strOccasion;
    cell.lblDate.text= [Utils getDateString:event.strDate];
    cell.lblRemainingDays.text = [Utils getRemainingDayString:event.strDate];
    
    
    cell.contentView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    cell.contentView.layer.borderWidth = 1;

    [cell setGiftTitle:event.isGifted];
    [cell setBgColor:event.isGifted];
    [cell setOccasionLabelConstrain:event.strName];
    [cell setDateTextColor:event.isGifted];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)btnAddClicked:(id)sender {
    
}


@end
 

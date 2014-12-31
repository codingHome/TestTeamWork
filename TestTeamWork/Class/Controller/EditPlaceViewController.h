//
//  EditPlaceViewController.h
//  TestTeamWork
//
//  Created by g5-1 on 14/12/31.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYViewController.h"
#import "ControllerHeader.h"
@interface EditPlaceViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,NavigationViewDelegate>
@property (nonatomic ,strong) UITableView* placeListTableView ;
@property (strong, nonatomic) MSDynamicsDrawerViewController *dynamicsDrawerViewController;
@end

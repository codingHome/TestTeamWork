//
//  MenuViewController.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/28.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "MenuViewController.h"
#import "EditPlaceViewController.h"

@interface MenuViewController ()
@property (nonatomic, strong)UITableView* myTableView;
@property (nonatomic ,strong) NSArray* cellList1  ;
@property (nonatomic ,strong) NSArray* cellList2  ;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor blackColor];
    self.myTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.myTableView.backgroundColor = [UIColor blackColor] ;
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    self.cellList1 = @[@"分享",@"编辑地点",@"目前位置"];
    self.cellList2 = @[@"设置",@"意见和建议",@"给此应用程序打分"];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return nil ;
        case 1:
            return @"工具" ;
        default:
            return @"Unknown";
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    } else {
        return 3;
    }
}
static NSString *identifier = @"cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //cell.textLabel.text = @"11";
    cell.backgroundColor = [UIColor darkGrayColor] ;
    [cell.textLabel setTintColor:[UIColor whiteColor]] ;
    switch (indexPath.section) {
        case 0:
            // cell.imageView. = [UIColor blackColor] ;
            cell.textLabel.text = self.cellList1[indexPath.row] ;
            break ;
        case 1:
            cell.textLabel.text = self.cellList2[indexPath.row] ;
            break ;
        default:
            cell.textLabel.text = @"Unknown" ;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            NSLog(@"分享") ;
            break;
        case 1:
        {
            EditPlaceViewController* share = [[EditPlaceViewController alloc]init ] ;
            [self presentModalViewController:share animated:YES];
        }
            break;

            
        default:
            break;
    }
    
}
@end

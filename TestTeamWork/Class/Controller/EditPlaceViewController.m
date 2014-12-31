//
//  EditPlaceViewController.m
//  TestTeamWork
//
//  Created by g5-1 on 14/12/31.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "EditPlaceViewController.h"

@interface EditPlaceViewController ()
@property (nonatomic ,strong) NSMutableArray* placeListArr ;
@property (nonatomic ,strong) NavigationView* editNav ;
@end

@implementation EditPlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI ] ;

}
- (void)initUI {
    self.placeListArr = [[NSMutableArray alloc]init ] ;
    //self.placeListArr = @[@"aaa"] ;
    self.placeListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    self.placeListTableView.backgroundColor = [UIColor blackColor] ;
    [self.placeListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    self.placeListTableView.delegate = self;
    self.placeListTableView.dataSource = self;
    [self.view addSubview:self.placeListTableView];
    
    self.editNav = [[NavigationView alloc]initWithFrame:CGRectMake(0, 5, SCREENWIDTH, 60)];
    self.editNav.delegate = self;
    self.editNav.dynamicsDrawerViewController = self.dynamicsDrawerViewController;
    [self.view addSubview:self.editNav];
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.placeListArr.count + 1 ;
}
static NSString *identifier = @"editCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (indexPath.row == 0) {
        UISwitch* swit = [[UISwitch alloc]initWithFrame:CGRectMake(250, 6, 30, 30) ];
        [cell addSubview:swit ] ;
        cell.textLabel.text = @"目前位置";
    }else {
    
    }
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

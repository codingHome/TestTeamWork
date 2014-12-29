//
//  SearchTableViewController.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/29.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH - 60, 0)];
    searchBar.delegate = self;
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchBar.keyboardAppearance = UIKeyboardAppearanceDark;
    [searchBar setBarTintColor:[UIColor clearColor]];
    
    [self.view addSubview:searchBar];
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH - 50, 0, 40, 40)];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.view addSubview:backButton];
    
    UISearchDisplayController *searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchController.searchResultsDataSource = self;
    searchController.searchResultsDelegate = self;
}
- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

static NSString *identifier = @"cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        
    }
    return cell;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
@end

//
//  ViewController.m
//  TestTeamWork
//
//  Created by 韩扬 on 14/12/9.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //add by hanyang
    NSLog(@"test team work 1");
    NSLog(@"暖男Yang 好腻害 *_*") ;
    NSLog(@"weisuobang");
    [self 暖男Yang ] ;

}

// 按钮不显示 求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教求指教
- (void)暖男Yang{
    UIView* llview = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/100, self.view.bounds.size.height/100, self.view.bounds.size.width/3, self.view.bounds.size.height/4)] ;
    llview.backgroundColor = [UIColor cyanColor] ;
    llview.alpha = 0.9 ;
    UIButton* llbtn = [[UIButton alloc]init ] ;
    llbtn.center = llview.center ;
    llbtn.backgroundColor = [UIColor blueColor] ;
    [llbtn addTarget:self action:@selector(暖暖:) forControlEvents:UIControlEventTouchUpInside  ];
    [llview addSubview:llbtn ];
    [self.view addSubview:llview ];
}
- (void)暖暖:(float)alp {
    if(alp >= 0.9){
        alp -= 0.3 ;
    }
    if(alp <= 0){
        alp += 0.3 ;
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

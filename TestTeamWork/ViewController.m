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

- (void)暖男Yang{
    UIView* llview = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/100, self.view.bounds.size.height/100, self.view.bounds.size.width/3, self.view.bounds.size.height/4)] ;
    llview.backgroundColor = [UIColor cyanColor] ;
    llview.alpha = 0.9 ;
    UIButton* llbtn = [[UIButton alloc]initWithFrame:CGRectMake(-15, -15, 30, 30) ] ;
    llbtn.center = llview.center ;
    llbtn.backgroundColor = [UIColor blueColor] ;
    [llbtn addTarget:self action:@selector(暖暖:) forControlEvents:UIControlEventTouchUpInside  ];
    [llview addSubview:llbtn ];
    [self.view addSubview:llview ];
    //时间不响应怎么破 怎么传参数
    //参数为llview的alpha值 怎么传过去
}
- (void)暖暖:(UIButton*)sender {
    if(sender.alpha >= 0.9){
        sender.alpha -= 0.3 ;
    }
    if(sender.alpha <= 0){
        sender.alpha += 0.3 ;
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

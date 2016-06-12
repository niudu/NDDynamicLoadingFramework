//
//  HotModuelViewController.m
//  HotModule
//
//  Created by niuDu on 16/5/27.
//  Copyright © 2016年 ND. All rights reserved.
//
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#import "HotModuelViewController.h"

@interface HotModuelViewController ()

@end

@implementation HotModuelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor  whiteColor];
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake((SCREENWIDTH-300)/2, 100, 300, 30)];
    label.text =@"我在沙盒中哦";
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake((SCREENWIDTH-130)/2, 300, 130, 30)];
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTitle:@"点我哦" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(setBackgroundColorAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}
-(void)setBackgroundColorAction{
    [self.view setBackgroundColor:[UIColor greenColor]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

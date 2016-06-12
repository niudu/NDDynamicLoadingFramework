//
//  PublicMeths.m
//  HotModule
//
//  Created by niuDu on 16/5/27.
//  Copyright © 2016年 ND. All rights reserved.
//

#import "PublicMeths.h"
#import "HotModuelViewController.h"
@implementation PublicMeths

+(id)loadHotVC{
    HotModuelViewController*hotVC =[[HotModuelViewController alloc]init];
    return hotVC;
}

-(void)showAlter{
    NSLog(@"ada");
    UIAlertView *alter =[[UIAlertView alloc]initWithTitle:@"😄" message:@"我是DylibTest.framework中的方法" delegate:nil cancelButtonTitle:@"点我取消" otherButtonTitles:nil, nil];
    [alter show];
}
@end

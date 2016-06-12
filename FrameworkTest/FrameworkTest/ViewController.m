//
//  ViewController.m
//  FrameworkTest527
//
//  Created by niuDu on 16/5/27.
//  Copyright © 2016年 ND. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadFrameworkAction:(id)sender {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentDirectory = nil;
    if ([paths count] != 0)
        documentDirectory = [paths objectAtIndex:0];
    NSLog(@"%@",documentDirectory);
    
    //拼接我们放到document中的framework路径
    NSString *libName = @"DylibTest.framework";
    NSString *destLibPath = [documentDirectory stringByAppendingPathComponent:libName];
    NSLog(@"%@",destLibPath);
    
    //判断一下有没有这个文件的存在　如果没有直接跳出
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:destLibPath]) {
        NSLog(@"There isn't have the file");
        NSString * showMessage =@"There isn't have the file";
        [self showMessageAlter:showMessage];
        return;
    }
    
    //使用NSBundle加载动态库
    NSError *error = nil;
    NSBundle *frameworkBundle = [NSBundle bundleWithPath:destLibPath];
    if (frameworkBundle && [frameworkBundle loadAndReturnError:&error]) {
        NSLog(@"bundle load framework success.");
    }else {
        NSLog(@"bundle load framework err:%@",error);
        NSString *  showMessage = [NSString stringWithFormat:@"bundle load framework err:%@",error];
        [self showMessageAlter:showMessage];
        return;
    }

    /*
     *通过NSClassFromString方式读取类
     *PublicMeths　为动态库中入口类
     */
    Class pacteraClass = NSClassFromString(@"PublicMeths");
    if (!pacteraClass) {
        NSLog(@"Unable to get TestDylib class");
        NSString *showMessage =@"Unable to get TestDylib class";
        [self showMessageAlter:showMessage];
        return;
    }
    
    NSObject *pacteraObject = [[pacteraClass alloc]init];
    if (pacteraObject && [pacteraObject respondsToSelector:@selector(showAlter)]){
    [pacteraObject performSelector:@selector(showAlter)];//实例方法
    }
    if (pacteraClass && [pacteraClass respondsToSelector:@selector(loadHotVC)]){
        UIViewController *vc= [pacteraClass performSelector:@selector(loadHotVC)];//类方法 return UIViewController
        [self.navigationController pushViewController:vc animated:YES];

    }
    
}

-(void)showMessageAlter:(NSString*)message{
    UIAlertView *alter =[[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"点我取消" otherButtonTitles:nil, nil];
    [alter show];
}
@end

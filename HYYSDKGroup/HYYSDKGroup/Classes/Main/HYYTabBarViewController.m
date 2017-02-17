//
//  HYYTabBarViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/17.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYTabBarViewController.h"
#import "HYYOneViewController.h"

@interface HYYTabBarViewController ()

@end

@implementation HYYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
-(void)setupUI{
    
    HYYOneViewController *oneVC = [[HYYOneViewController alloc]init];
    oneVC.title = @"实用技术";
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:oneVC];
    nav1.tabBarItem.title = @"实用技术";
    self.viewControllers = @[nav1];
    
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

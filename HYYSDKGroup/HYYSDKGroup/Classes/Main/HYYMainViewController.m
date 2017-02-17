//
//  HYYMainViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/17.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYMainViewController.h"
#import "HYYTabBarViewController.h"
@interface HYYMainViewController ()

@end

@implementation HYYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    HYYTabBarViewController *tabVC = [[HYYTabBarViewController alloc]init];
    [self addChildViewController:tabVC];
    tabVC.view.frame = self.view.frame;
    [self.view addSubview:tabVC.view];
    [tabVC didMoveToParentViewController:self];
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

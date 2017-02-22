//
//  HYYMapMainViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/22.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYMapMainViewController.h"
#import "HYYLocalViewController.h"

@interface HYYMapMainViewController ()

@end

@implementation HYYMapMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI{
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    // MARK: - 定位按钮
    UIButton *mapBtn = [[UIButton alloc] init];
    [self.view addSubview:mapBtn];
    
    [mapBtn setTitle:@"开始定位" forState:UIControlStateNormal];
    
    [mapBtn setBackgroundColor:[UIColor whiteColor]];
    [mapBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mapBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
#pragma mark - 约束
    [mapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
    }];
}
-(void)clickAction:(UIButton *)btn{
    HYYLocalViewController *localVC = [[HYYLocalViewController alloc]init];
    [self.navigationController pushViewController:localVC animated:NO];
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

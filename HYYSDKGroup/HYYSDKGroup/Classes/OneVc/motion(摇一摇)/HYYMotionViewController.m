//
//  HYYMotionViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/19.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYMotionViewController.h"

@interface HYYMotionViewController ()

    @property(nonatomic, weak)UILabel *label;
    
@end

@implementation HYYMotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];

}
-(void)setupUI{
    
    self.view.backgroundColor = [UIColor orangeColor];
    UILabel *label = [[UILabel alloc]init];
    self.label = label;
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"请摇晃手机";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
    }];
    
}
    // 开始摇晃手机
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    self.label.hidden = YES;
    [SVProgressHUD showSuccessWithStatus:@"检测到摇动"];
    
    
}
// 取消摇动  应用被打断
-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [SVProgressHUD showErrorWithStatus:@"摇动被打断或取消"];
}
    
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [SVProgressHUD showSuccessWithStatus:@"摇动结束"];

        
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        self.label.hidden = NO;
    });
    
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

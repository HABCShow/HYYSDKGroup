//
//  HYYFingerViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/18.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYFingerViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>


@interface HYYFingerViewController ()

@end

@implementation HYYFingerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self setupUI];
}

-(void)setupUI{
    
    UIButton *btn = [[UIButton alloc]init];
    [self.view addSubview:btn];
    [btn setTitle:@"点击按钮->指纹验证变换颜色" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor whiteColor];
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.equalTo(@35);
    }];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)btnAction:(UIButton *)button{
        // 判断版本
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        LAContext *context = [[LAContext alloc]init];
        context.localizedFallbackTitle = @"密码输入";
        // 检查是否支持指纹识别   硬件要求5s以上
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:nil]) {
            // 可以使用指纹识别
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"请进行指纹解锁🔓" reply:^(BOOL success, NSError * _Nullable error) {
                if (success) {
                    // 主线程回调
                    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                       
                        __weak typeof (self) weakSelf = self;
                        weakSelf.view.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(255) / 255.0) green:(arc4random_uniform(255) / 255.0) blue:(arc4random_uniform(255) / 255.0) alpha:1];
                    }];
                    // 成功弹窗
                    [self showAlertView:@"指纹识别成功"];
                }
                // 错误
                if (error) {
                    switch (error.code) {
                        case kLAErrorAppCancel:
                        [self showAlertView:@"您取消验证"];
                        break;
                        case kLAErrorAuthenticationFailed:[self showAlertView:@"您错误超过三次"];
                        break;
                        case kLAErrorTouchIDLockout:
                        [self showAlertView:@"您五次验证错误，指纹功能已被锁定,请到主屏幕重新解锁"];
                        break;
                        case kLAErrorUserFallback:
                        [self showAlertView:@"您点击了密码输入"];
                        default:
                        break;
                    }
                    
                }
                
            }];
            
            
        }else{
            // 不支持
            NSLog(@"指纹识别不可用");
            [self showAlertView:@"指纹识别不可用"];
        }
        
    }else{
        // 不支持
        [self showAlertView:@"指纹识别不可用"];
        NSLog(@"指纹识别不可用");
        
    }
        
    }
    -(void)showAlertView:(NSString *)title{
        
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
        }];
        
        
    }

@end

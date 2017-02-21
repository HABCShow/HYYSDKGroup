//
//  HYYSMSViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/20.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYSMSViewController.h"
#import <SMS_SDK/SMSSDK.h>



@interface HYYSMSViewController ()
    @property(nonatomic, weak)UITextField *textField;
    @property(nonatomic, weak)UITextField *textField1;


@end

@implementation HYYSMSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [SMSSDK registerApp:@"17f2e4ec6e100" withSecret:@"a2e42f3b9e1aaf7a278dba1126c85b9a"];
//     [SMSSDK registerApp:@"196a8788a7f78" withSecret:@"c4ff8a860fde6c3c459a783f02759802"];
    [SVProgressHUD setMinimumDismissTimeInterval:0.5];

    // 17f2e4ec6e100    a2e42f3b9e1aaf7a278dba1126c85b9a
}
-(void)setupUI{
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    // MARK: - 显示label
    UILabel *label = [[UILabel alloc] init];
    
    [self.view addSubview: label];
    
    label.text = @"短信验证";
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(100);
        
        make.left.equalTo(self.view).offset(30);
        
        make.right.equalTo(self.view).offset(-30);
        
    }];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    // MARK: - 手机号输入框
    UITextField *textField = [[UITextField alloc] init];
    
    textField.backgroundColor = [UIColor whiteColor];
    
    textField.keyboardType =  UIKeyboardTypeNumberPad;
    
    textField.placeholder = @"请输入您的手机号";
    
    self.textField = textField;
    
    [self.view addSubview:textField];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(label);
        
        make.top.equalTo(label.mas_bottom).offset(50);
        
        make.height.mas_equalTo(36);
        
    }];
    
    // MARK: - 验证码输入框
    UITextField *textField1 = [[UITextField alloc] init];
    
    textField1.backgroundColor = [UIColor whiteColor];
    
    textField1.keyboardType =  UIKeyboardTypeNumberPad;
    
    textField1.placeholder = @"请输入您验证码";
    
    self.textField1 = textField1;
    
    [self.view addSubview:textField1];
    
    [textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(textField.mas_bottom).offset(50);
        
        make.left.right.equalTo(textField);
        
        make.height.mas_equalTo(36);
    }];
    
    // MARK: - 获取验证码按钮
    UIButton *obtainButton = [[UIButton alloc] init];
    
    [self.view addSubview: obtainButton];
    
    [obtainButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    obtainButton.backgroundColor = [UIColor redColor];
    
    [obtainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 36));
        
        make.top.equalTo(textField1.mas_bottom).offset(30);
        
        make.left.equalTo(textField1);
    }];
    
    [obtainButton addTarget:self action:@selector(obtainSMS:) forControlEvents:UIControlEventTouchUpInside];
    
    // MARK: - 提交验证码
    UIButton *commitButton = [[UIButton alloc] init];
    
    [self.view addSubview: commitButton];
    
    [commitButton setTitle:@"提交验证码" forState:UIControlStateNormal];
    
    commitButton.backgroundColor = [UIColor redColor];
    
    [commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 36));
        
        make.top.equalTo(textField1.mas_bottom).offset(30);
        
        make.right.equalTo(self.textField1);
    }];
    
    [commitButton addTarget:self action:@selector(commitSMS:) forControlEvents:UIControlEventTouchUpInside];
    
    // MARK: - 语言验证
    UIButton *voiceButton = [[UIButton alloc] init];
    
    [self.view addSubview: voiceButton];
    
    [voiceButton setTitle:@"获取语言验证码" forState:UIControlStateNormal];
    
    voiceButton.backgroundColor = [UIColor redColor];
    
    [voiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 36));
        
        make.top.equalTo(obtainButton.mas_bottom).offset(30);
        
        make.left.equalTo(obtainButton);
    }];
    
    [voiceButton addTarget:self action:@selector(voiceSMS:) forControlEvents:UIControlEventTouchUpInside];
}
// 获取短信验证码
-(void)obtainSMS:(UIButton *)btn{
    [self.textField resignFirstResponder];
    
    [self.textField1 resignFirstResponder];
    NSString *num = self.textField.text;
  [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:num zone:@"86" customIdentifier:nil   result:^(NSError *error) {
      if (!error) {
          NSLog(@"获取验证码成功");
          [SVProgressHUD showSuccessWithStatus:@"获取验证码成功"];
      } else {
          NSLog(@"错误信息：%@",error);
           [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",error.userInfo[@"getVerificationCode"]]];
      }
  }];
}
    // 提交验证码
-(void)commitSMS:(UIButton *)btn{
    [self.textField resignFirstResponder];
    
    [self.textField1 resignFirstResponder];
    [SMSSDK commitVerificationCode:self.textField1.text phoneNumber:self.textField.text zone:@"86" result:^(SMSSDKUserInfo *userInfo, NSError *error) {
        
        if (!error) {
            
            [SVProgressHUD showSuccessWithStatus:@"验证成功"];
            
            // MARK: - 验证成功push控制器
            UIViewController *vc =[[UIViewController alloc] init];
            
            vc.title = @"测试控制器";
            
            vc.view.backgroundColor = [UIColor lightGrayColor];
            
            [self.navigationController pushViewController:vc animated:NO];
            
        }else{
            
            [SVProgressHUD showErrorWithStatus:@"验证失败"];
        }
        
    }];
    
    
}
    
    
-(void)voiceSMS:(UIButton *)btn{
    [self.textField resignFirstResponder];
    
    [self.textField1 resignFirstResponder];
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodVoice
                            phoneNumber:self.textField.text
                                   zone:@"86"
                       customIdentifier:nil
                                 result:^(NSError *error) {
                                     
                                     if (!error) {
                                         
                                         [SVProgressHUD showSuccessWithStatus:@"获取验证码成功"];
                                     }else{
                                         
                                         [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",error.userInfo[@"getVerificationCode"]]];
                                     }
                                 }];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.textField resignFirstResponder];
    
    [self.textField1 resignFirstResponder];
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

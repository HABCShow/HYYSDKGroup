//
//  HYYShareViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/21.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYShareViewController.h"
#import <UMSocialCore/UMSocialCore.h>


@interface HYYShareViewController ()

@end

@implementation HYYShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self setupUI];
}
-(void)setupUI{
    
    // MARK: - 分享按钮
    UIButton *umengShareBtn = [[UIButton alloc] init];
    
    [self.view addSubview:umengShareBtn];
    
    [umengShareBtn setTitle:@"友盟新浪微博分享" forState:UIControlStateNormal];
    
    [umengShareBtn setBackgroundColor:[UIColor whiteColor]];
    [umengShareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [umengShareBtn addTarget:self action:@selector(clickUmengBtn) forControlEvents:UIControlEventTouchUpInside];
    
    // MARK: - 登陆按钮
    UIButton *umengLoginBtn = [[UIButton alloc] init];
    
    [self.view addSubview:umengLoginBtn];
    
    [umengLoginBtn setTitle:@"友盟第三方登陆" forState:UIControlStateNormal];
    
    [umengLoginBtn setBackgroundColor:[UIColor whiteColor]];
    [umengLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [umengLoginBtn addTarget:self action:@selector(clickUmengLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark - 约束
    [umengShareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        
        make.centerY.equalTo(self.view).offset(-50);
    }];
    
    [umengLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        
        make.centerY.equalTo(self.view).offset(50);
    }];
}

// 分享
-(void)clickUmengBtn{
    
    [self shareWebPageToPlatformType:UMSocialPlatformType_Sina];
}

    // 三方登陆
-(void)clickUmengLoginBtn{
    
    [self getUserInfoForPlatform:UMSocialPlatformType_Sina];
}
    // 分享
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
    {
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        
        //创建网页内容对象
        NSString* thumbURL =  @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"欢迎使用【友盟+】社会化组件U-Share" descr:@"欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！" thumImage:thumbURL];
        //设置网页地址
        shareObject.webpageUrl = @"http://mobile.umeng.com/social";
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        
        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
            if (error) {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
                NSString *message = @"可能是您取消了分享，或者检查您的网络";
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"分享失败" message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", nil) otherButtonTitles:nil];
                [alert show];
                
                
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    //分享结果消息
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    //第三方原始返回的数据
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"分享成功" message:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", nil) otherButtonTitles:nil];
                    [alert show];
                    
                }else{
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"分享成功2" message:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", nil) otherButtonTitles:nil];
                    [alert show];
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
        }];
    }
//三方登陆
- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
    {
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
            
            if (!error) {
                
                UMSocialUserInfoResponse *resp = result;
                
                // 第三方登录数据(为空表示平台未提供)
                // 授权数据
                NSLog(@" uid: %@", resp.uid);
                NSLog(@" openid: %@", resp.openid);
                NSLog(@" accessToken: %@", resp.accessToken);
                NSLog(@" refreshToken: %@", resp.refreshToken);
                NSLog(@" expiration: %@", resp.expiration);
                
                // 用户数据
                NSLog(@" name: %@", resp.name);
                NSLog(@" iconurl: %@", resp.iconurl);
                NSLog(@" gender: %@", resp.gender);
                
                // 第三方平台SDK原始数据
                NSLog(@" originalResponse: %@", resp.originalResponse);
                NSString *message = [NSString stringWithFormat:@"name: %@\n icon: %@\n uid: %@\n",resp.name,resp.iconurl,resp.uid];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"授权成功"
                                                                message:message
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
                [alert show];

                
            }else{
                NSString *message = @"可能是您取消了授权，或者检查您的网络";
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"授权失败" message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", nil) otherButtonTitles:nil];
                [alert show];
                
            }
            
            
       
        }];
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

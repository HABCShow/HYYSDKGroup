//
//  HYYPayViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/28.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYPayViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "DataSigner.h"

@interface HYYPayViewController ()

@end

@implementation HYYPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self setupUI];
}
-(void)setupUI{
    
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"触摸付款";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 封装订单对象
    Order *order = [[Order alloc] init];
    //合作伙伴ID     支付宝1.0的支付四要素之一
    order.partner = @"2088221626451032";
    //支付宝账号 (钱打入该账号)    支付宝1.0的支付四要素之一
    order.sellerID = @"3393900637@qq.com";
    //订单号   支付宝1.0的支付四要素之一
    order.outTradeNO = [NSString stringWithFormat:@"huanglinwang%d",arc4random_uniform(1000)]; //订单ID（由商家自行制定）
    //商品标题
    order.subject = @"红裤衩";
    //商品描述
    order.body = @"外穿可以飞";
    ////商品价格   支付宝1.0的支付四要素之一
    order.totalFee = @"0.01";
    //回调URL
    order.notifyURL = @"http://www.test.com";
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    //超时时长
    order.itBPay = @"30m";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types  设置应用回跳的Scheme
    NSString *appScheme = @"wb3543611613";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    //真实开发中将私钥放在服务端,现在在客户端进行加密是为了方便测试
    NSString *privateKey = @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAMStleK6i5AOGkd5NPUYFlkZJuk56aLhWR8U1ataEGWALOA3d8n3XaIO9tQEzJJUVJIKbCDIR9D1zPS9LPchloqb0OHk9y9I4SJss1ZQZayDWW179ojpOzTqhmto7d566+mebddjRcNiUwD2bDGmcWXigCyAvncHKaW4nuO9iuVfAgMBAAECgYEAu/48PasXycthHR5jGz855VJgWh/sDa+e01HD5vTApXR98Je0XY2fp07sab5omBoZeDqUHkWyN68riGfmuhYV4JyWppub5iayzxHS2N5761PmB+2RxxD6bF7k+cy1qG84sZw0t3qUaChCJiizK5LAd9uNSv50n9Dr7MwHz3OgHcECQQDgofT1SdwQ3WJdXUIkeYhe0LaXbO3hiT5LmfO685TQMov2efYgBjfa22VvFxJd1tei2ml6mYWIx+1zAfe+xwu/AkEA4CRS7xH1tbEJknLVbpWwWjHCaA0bd155y/9/Bkvm0taOtm4pdddm5Mrz+w+dh1mYivWy01c0NLy9I6mmWUUOYQJAWOzEZDYRADwjrII2pOnXqnFFVzywDxCdsKAJdIDo8GKSNciiPps3kVQ5G3kutCdQxg9gokAUNMmwnk6xHLz/UQJBALEXgf8prXz0d5+h40gQNNnOXs9fK8hQeOLY5z/OUH1c0D0LJO7aVY2HXOWMHOaHv6JrJfMc/z57sOSwcaIukYECQQCUhwTfT5hjn1F1yzvCb/l9HugT3qPlgtHCWAtWiPzFS3nbTFmB0szkoW0/ao9uddsMI5MMGN88xy34aN1FPhi5";
    //使用RSA的私钥对订单信息进行加密
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"", orderSpec, signedString, @"RSA"];
        
        //进行支付操作
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            //【callback处理支付结果】
            NSLog(@"reslut = %@",resultDic);
        }];
        
    }
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

//
//  HYYProximityViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/19.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYProximityViewController.h"

@interface HYYProximityViewController ()
    
@property(nonatomic, weak)UILabel *label;

@end

@implementation HYYProximityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // 打开近距离传感器
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    // 监听距离变化
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(proximityStateChange) name:UIDeviceProximityStateDidChangeNotification object:nil];
    

}
    
-(void)proximityStateChange{
    
    if ([UIDevice currentDevice].proximityState) {
        self.label.text = @"能不能离我远点";
        
    }else{
        self.label.text = @"请靠近传感器";
    }
    
}

-(void)setupUI{
    self.view.backgroundColor = [UIColor orangeColor];
    UILabel *label = [[UILabel alloc]init];
    self.label = label;
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"请将手靠近传感器";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
    }];
}

// 应用场景
-(void)text{
    
    // 1会话
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    // 2视频
    [UIDevice currentDevice].proximityMonitoringEnabled = NO;
    // 不锁屏
    [UIApplication sharedApplication].idleTimerDisabled = YES;
}
-(void)dealloc{
    [UIDevice currentDevice].proximityMonitoringEnabled = NO;
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

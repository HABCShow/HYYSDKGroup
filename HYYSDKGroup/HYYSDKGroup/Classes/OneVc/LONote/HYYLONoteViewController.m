//
//  HYYLONoteViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/20.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYLONoteViewController.h"

@interface HYYLONoteViewController ()

@end

@implementation HYYLONoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = @"localNote";
    UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
    action1.identifier = @"foreground";
    action1.title = @"前台按钮";
    action1.activationMode = UIUserNotificationActivationModeForeground;
    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
    action2.identifier = @"background";
    action2.title = @"后台按钮";
    action2.activationMode = UIUserNotificationActivationModeBackground;
    action2.behavior = UIUserNotificationActionBehaviorTextInput;
    action2.parameters = @{UIUserNotificationTextInputActionButtonTitleKey:@"回复"};
    [category setActions:@[action1,action2] forContext:UIUserNotificationActionContextDefault];
    
    // 8.0 以上需要授权
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge categories:[NSSet setWithObject:category]];
  
    // 1 注册
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    
}

-(void)setupUI{
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"发送本地通知" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [btn setShowsTouchWhenHighlighted:YES];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn sizeToFit];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnAction{
    
    UILocalNotification *note = [[UILocalNotification alloc]init];
    // 横幅内容
    note.alertBody = @"您收到了一条通知";
    // 触发时间
    note.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    note.userInfo = @{@"context":@"嗨，您好！"};
    note.category = @"localNote";
    note.soundName = UILocalNotificationDefaultSoundName;
    // 预定通知
    [[UIApplication sharedApplication]scheduleLocalNotification:note];
    
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

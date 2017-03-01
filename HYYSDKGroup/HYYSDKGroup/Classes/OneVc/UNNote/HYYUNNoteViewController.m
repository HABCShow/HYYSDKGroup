//
//  HYYUNNoteViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/3/1.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYUNNoteViewController.h"
#import <UserNotifications/UserNotifications.h>

typedef enum {
    KNoteImage = 10,
    KNoteAudio = 11,
    KNoteMovie = 12
}NoteType;

@interface HYYUNNoteViewController ()<UNUserNotificationCenterDelegate>

@end

@implementation HYYUNNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UNUserNotificationCenter currentNotificationCenter]requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionCarPlay completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            NSLog(@"10.0 授权成功");
            [UNUserNotificationCenter currentNotificationCenter].delegate = self;
        }else{
            NSLog(@"10.0授权失败");
        }
    }];
    
    [self setupUI];
}
-(void)setupUI{
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    // MARK: - 图片按钮
    UIButton *imgBtn = [[UIButton alloc] init];
    imgBtn.tag = KNoteImage;
    [self.view addSubview:imgBtn];
    [imgBtn setShowsTouchWhenHighlighted:YES];

    [imgBtn setTitle:@"通知附带图片" forState:UIControlStateNormal];
    
    [imgBtn setBackgroundColor:[UIColor whiteColor]];
    [imgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [imgBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // MARK: - 音频按钮
    UIButton *audioBtn = [[UIButton alloc] init];
    audioBtn.tag = KNoteAudio;
    [self.view addSubview:audioBtn];
    [audioBtn setShowsTouchWhenHighlighted:YES];

    [audioBtn setTitle:@"通知附带音频" forState:UIControlStateNormal];
    
    [audioBtn setBackgroundColor:[UIColor whiteColor]];
    [audioBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [audioBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // MARK: - 视频按钮
    UIButton *movieBtn = [[UIButton alloc] init];
    movieBtn.tag = KNoteMovie;
    [self.view addSubview:movieBtn];
    
    [movieBtn setTitle:@"通知附带视频" forState:UIControlStateNormal];
    
    [movieBtn setBackgroundColor:[UIColor whiteColor]];
    [movieBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [movieBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [movieBtn setShowsTouchWhenHighlighted:YES];

    
#pragma mark - 约束
    [imgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
    }];
    
    [audioBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        
        make.centerY.equalTo(self.view).offset(-50);
    }];
    
    [movieBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        
        make.centerY.equalTo(self.view).offset(50);
    }];
}

-(void)btnClick:(UIButton *)button{
    
    switch (button.tag) {
        case KNoteImage:
            
            break;
        case KNoteAudio:
            
            break;
        case KNoteMovie:
            
            break;
        default:
            break;
    }
    
    
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

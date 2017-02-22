//
//  HYYLocalViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/22.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYLocalViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface HYYLocalViewController ()
    @property(nonatomic)MAMapView *mapView;

@end

@implementation HYYLocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
//    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    MAMapView *mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView = mapView;
    ///把地图添加至view
    [self.view addSubview:mapView];
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    mapView.showsUserLocation = YES;
    mapView.userTrackingMode = MAUserTrackingModeFollow;
    mapView.showsIndoorMap = YES;
    mapView.showTraffic = YES;
    mapView.compassOrigin= CGPointMake(_mapView.compassOrigin.x, 22);
    mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 22);
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:@"ic_sport_gps_map_close"] forState:UIControlStateNormal];
    [mapView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(mapView).offset(-2);
        make.bottom.equalTo(mapView).offset(-2);
        make.height.with.mas_equalTo(43);
    }];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btnClick{
    self.navigationController.navigationBarHidden = NO;

    [self.navigationController popViewControllerAnimated:NO];
    
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

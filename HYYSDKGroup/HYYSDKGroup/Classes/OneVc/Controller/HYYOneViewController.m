//
//  HYYOneViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/17.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYOneViewController.h"
#import "oneModel.h"
#import "HYYOneCollectionViewCell.h"



static NSString *CellID = @"collectionViewCell";

@interface HYYOneViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation HYYOneViewController
{
    UICollectionView *_collection;
    NSArray<oneModel *> *_nameList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 60) / 2 , 50);
    flowLayout.minimumLineSpacing = 20;
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    _collection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collection.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    [self.view addSubview:_collection];
    [_collection registerClass:[HYYOneCollectionViewCell class] forCellWithReuseIdentifier:CellID];
    _collection.delegate = self;
    _collection.dataSource = self;
}
-(void)loadData{
    
    NSDictionary *dict = @{@"title":@"指纹解锁",@"nameVC":@"HYYFingerViewController"};
    NSDictionary *dict1 = @{@"title":@"距离传感",@"nameVC":@"HYYProximityViewController"};
    NSDictionary *dict2 = @{@"title":@"摇一摇",@"nameVC":@"HYYMotionViewController"};
    NSDictionary *dict3 = @{@"title":@"本地通知",@"nameVC":@"HYYLONoteViewController"};
    NSArray *dictArr = @[dict,dict1,dict2,dict3];
    NSMutableArray *arr = [NSMutableArray array];
    [dictArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       oneModel *model = [oneModel oneModelWithDiction:obj];
        [arr addObject:model];
    }];
    _nameList = arr.copy;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _nameList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HYYOneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    cell.model = _nameList[indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *vcName = _nameList[indexPath.item].nameVC;
    Class cls = NSClassFromString(vcName);
    UIViewController *vc = [cls new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:NO];
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

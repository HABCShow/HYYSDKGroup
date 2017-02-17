//
//  HYYOneViewController.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/17.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYOneViewController.h"


static NSString *CellID = @"collectionViewCell";

@interface HYYOneViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation HYYOneViewController
{
    UICollectionView *_collection;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 60) / 2 , 50);
    flowLayout.minimumLineSpacing = 20;
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    _collection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collection.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    [self.view addSubview:_collection];
    [_collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellID];
    _collection.delegate = self;
    _collection.dataSource = self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
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

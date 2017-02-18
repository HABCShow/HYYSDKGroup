//
//  HYYOneCollectionViewCell.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/18.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYOneCollectionViewCell.h"

@interface HYYOneCollectionViewCell ()

@property(nonatomic, weak)UILabel *titleLabel;

@end

@implementation HYYOneCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        
    }
    return self;
    
}

-(void)setupUI{
    
    UILabel *label = [[UILabel alloc]init];
    self.titleLabel = label;
    [self.contentView addSubview:label];
    label.backgroundColor = [UIColor blackColor];
    
    
    
}

@end

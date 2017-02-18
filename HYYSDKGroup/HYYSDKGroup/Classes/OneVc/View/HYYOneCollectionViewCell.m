//
//  HYYOneCollectionViewCell.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/18.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "HYYOneCollectionViewCell.h"
#import "oneModel.h"

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
    self.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc]init];
    self.titleLabel = label;
    [self.contentView addSubview:label];
    label.backgroundColor = [UIColor orangeColor];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];

}

-(void)setModel:(oneModel *)model{
    self.titleLabel.text = model.title;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
}
    
@end

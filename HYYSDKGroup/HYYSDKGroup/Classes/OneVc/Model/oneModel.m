//
//  oneModel.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/18.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "oneModel.h"

@implementation oneModel

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)oneModelWithDiction:(NSDictionary *)dict{
    
    return [[self alloc]initWithDictionary:dict];
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end

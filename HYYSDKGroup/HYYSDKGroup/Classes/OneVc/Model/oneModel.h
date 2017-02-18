//
//  oneModel.h
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/18.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface oneModel : NSObject
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *nameVC;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)oneModelWithDiction:(NSDictionary *)dict;

@end

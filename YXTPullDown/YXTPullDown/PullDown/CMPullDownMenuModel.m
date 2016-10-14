//
//  CMPullDownMenuModel.m
//  CoffeeMall--单级下拉菜单
//
//  Created by 杨小童 on 16/2/3.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import "CMPullDownMenuModel.h"

@implementation CMPullDownMenuModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.title = dict[@"title"];
        self.titleNum = dict[@"titleNum"];
        self.selectState = [dict[@"selectState"]boolValue];
    }
    return  self;
}


@end

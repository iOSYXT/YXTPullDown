//
//  CMPullDownMenuModel.h
//  CoffeeMall--单级下拉菜单
//
//  Created by 杨小童 on 16/2/3.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMPullDownMenuModel : NSObject

@property(strong,nonatomic)NSString *title;//商品图片
@property(strong,nonatomic)NSString *titleNum;//商品标题
@property(assign,nonatomic)BOOL selectState;//是否选中状态


-(instancetype)initWithDict:(NSDictionary *)dict;

@end

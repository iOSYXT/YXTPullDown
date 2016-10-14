//
//  CMPullDownMenuCell.h
//  CoffeeMall--单级下拉菜单
//
//  Created by 杨小童 on 16/2/3.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CMPullDownMenuModel.h"

@interface CMPullDownMenuCell : UITableViewCell

@property(strong,nonatomic) UILabel *titleLabel;//商品图片
@property(strong,nonatomic) UILabel *titleNumLabel;//商品标题

@property(assign,nonatomic)BOOL selectState;//选中状态

//赋值
-(void)addTheValue:(CMPullDownMenuModel *)menuModel;

@end

//
//  CMPullDownMenuCell.m
//  CoffeeMall--单级下拉菜单
//
//  Created by 杨小童 on 16/2/3.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import "CMPullDownMenuCell.h"

#define WIDTH6 [UIScreen mainScreen].bounds.size.width

@implementation CMPullDownMenuCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //布局界面
        UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH6, 44)];
        bgView.backgroundColor = [UIColor whiteColor];
        
        //添加titleLabel
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 100, 24)];
        _titleLabel.text = @"afadsfa fa";
        _titleNumLabel.textAlignment = NSTextAlignmentLeft;
        [_titleLabel setTextColor:[UIColor grayColor]];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        [bgView addSubview:_titleLabel];
        
        //添加titleNumLabel
        _titleNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH6 - 45, 10, 30, 24)];
        _titleNumLabel.layer.cornerRadius = 5;
        _titleNumLabel.layer.masksToBounds = YES;
        _titleNumLabel.text = @"afadsfa fa";
        [_titleNumLabel setTextColor:[UIColor grayColor]];
        _titleNumLabel.font = [UIFont systemFontOfSize:13];
        _titleNumLabel.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:241 / 255.0 blue:242 / 255.0 alpha:1];
        _titleNumLabel.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:_titleNumLabel];
    
        
        [self addSubview:bgView];
    }
    return self;
}

/**
 *  给单元格赋值
 *
 *  @param goodsModel 里面存放各个控件需要的数值
 */
-(void)addTheValue:(CMPullDownMenuModel *)menuModel
{
    _titleLabel.text = menuModel.title;
    _titleNumLabel.text = menuModel.titleNum;
    
    
    if (menuModel.selectState)
    {
        _selectState = YES;
        _titleLabel.textColor = [UIColor colorWithRed:255 / 255.0 green:107 / 255.0 blue:0 / 255.0 alpha:1];
        _titleNumLabel.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:107 / 255.0 blue:0 / 255.0 alpha:1];
        _titleNumLabel.textColor = [UIColor whiteColor];
        
    }else{
        _selectState = NO;
        _titleLabel.textColor = [UIColor grayColor];
        _titleNumLabel.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:241 / 255.0 blue:242 / 255.0 alpha:1];
        _titleNumLabel.textColor = [UIColor grayColor];
    }
    
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

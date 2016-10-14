//
//  CMPullDownMenuView.h
//  CoffeeMall--单级下拉菜单
//
//  Created by 杨小童 on 16/2/3.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMPullDownMenuView : UIView

-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSMutableArray *)titleArray titleNumArray:(NSMutableArray *)titleNumArray;

- (void)showPullDownMenuView;
- (void)hiddenPullDownMenuView;

typedef void (^menublock)(NSString *str);
@property (nonatomic, copy) menublock block;

@end

//
//  CMPullDownMenuView.m
//  CoffeeMall--单级下拉菜单
//
//  Created by 杨小童 on 16/2/3.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import "CMPullDownMenuView.h"

#import "CMPullDownMenuCell.h"
#import "CMPullDownMenuModel.h"

@interface CMPullDownMenuView ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *infoArr;
}

@property (nonatomic, strong) UIView *pullDownMenuBGView;
@property (nonatomic, strong) UITableView *pullDownMenuTableView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *titleNumArray;

@end

@implementation CMPullDownMenuView

-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSMutableArray *)titleArray titleNumArray:(NSMutableArray *)titleNumArray
{
    self = [super initWithFrame:CGRectMake(0, 0, 375, 667)];
    if (self) {
        
        self.pullDownMenuBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
        self.pullDownMenuBGView.backgroundColor = [UIColor blackColor];
        self.pullDownMenuBGView.userInteractionEnabled = YES;
        UITapGestureRecognizer *pullDownMenuBGViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pullDownMenuBGViewTapClick)];
        [self.pullDownMenuBGView addGestureRecognizer:pullDownMenuBGViewTap];
        self.pullDownMenuBGView.alpha = 0.0;
        [self addSubview:self.pullDownMenuBGView];
        
        self.pullDownMenuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 0) style:UITableViewStylePlain];
        self.pullDownMenuTableView.backgroundColor = [UIColor whiteColor];
        self.pullDownMenuTableView.alpha = 0.0;
        self.pullDownMenuTableView.dataSource = self;
        self.pullDownMenuTableView.delegate = self;
        [self addSubview:self.pullDownMenuTableView];
        
        self.titleArray = [NSMutableArray arrayWithArray:titleArray];
        self.titleNumArray = [NSMutableArray arrayWithArray:titleNumArray];
        
        //初始化数据
        infoArr = [[NSMutableArray alloc]init];
        /**
         *  初始化一个数组，数组里面放字典。字典里面放的是单元格需要展示的数据
         */
        for (int i = 0; i<self.titleArray.count; i++)
        {
            NSMutableDictionary *infoDict = [[NSMutableDictionary alloc]init];
            [infoDict setValue:self.titleArray[i] forKey:@"title"];
            [infoDict setValue:self.titleNumArray[i] forKey:@"titleNum"];
            if (i == 0) {
               [infoDict setValue:[NSNumber numberWithBool:YES] forKey:@"selectState"];
            } else {
                [infoDict setValue:[NSNumber numberWithBool:NO] forKey:@"selectState"];
            }
            
            
            //封装数据模型
            CMPullDownMenuModel *goodsModel = [[CMPullDownMenuModel alloc]initWithDict:infoDict];
            
            //将数据模型放入数组中
            [infoArr addObject:goodsModel];
        }
        
        
        [self hiddenPullDownMenuView];
        
        
    }
    
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuse = @"reuse";
    CMPullDownMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (cell == nil) {
        cell = [[CMPullDownMenuCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    //调用方法，给单元格赋值
    [cell addTheValue:infoArr[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.block(self.titleArray[indexPath.row]);
    
    for (CMPullDownMenuModel *menuModel in infoArr) {
        menuModel.selectState=NO;
    }
    
    CMPullDownMenuModel *menuModel = infoArr[indexPath.row];
    menuModel.selectState=YES;
    
    [tableView reloadData];
    
    [self hiddenPullDownMenuView];
    
}

- (void)pullDownMenuBGViewTapClick
{
    self.block(@"");
    [self hiddenPullDownMenuView];
}

- (void)showPullDownMenuView
{
    self.pullDownMenuBGView.hidden = NO;
    self.pullDownMenuTableView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.pullDownMenuBGView.alpha = 0.3;
        self.pullDownMenuTableView.alpha = 1;
        self.pullDownMenuTableView.frame = CGRectMake(0, 0, 375, 175);
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)hiddenPullDownMenuView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.pullDownMenuBGView.alpha = 0.0;
        self.pullDownMenuTableView.alpha = 0.0;
        self.pullDownMenuTableView.frame = CGRectMake(0, 0, 375, 0);
    } completion:^(BOOL finished) {
        self.pullDownMenuBGView.hidden = YES;
        self.pullDownMenuTableView.hidden = YES;
    }];
    
}

@end

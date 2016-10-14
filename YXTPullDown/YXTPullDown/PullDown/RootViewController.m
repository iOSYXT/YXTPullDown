//
//  RootViewController.m
//  CoffeeMall--单级下拉菜单
//
//  Created by 杨小童 on 16/2/3.
//  Copyright © 2016年 YXT. All rights reserved.
//

#import "RootViewController.h"

#import "CMPullDownMenuView.h"

@interface RootViewController ()

@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *titleNumArray;

@property (nonatomic, strong) UIButton *titleButton;
@property (nonatomic, strong) UIImageView *titleImageView;;

@property (nonatomic, strong) CMPullDownMenuView *pullDownMenuView;


@end

@implementation RootViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.titleArray = [NSMutableArray array];
        self.titleNumArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [titleView setBackgroundColor:[UIColor redColor]];
    
    self.titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.titleButton setFrame:CGRectMake(0, 0, 80, 30)];
    [self.titleButton setTitle:@"全部订单" forState:UIControlStateNormal];
    [self.titleButton addTarget:self action:@selector(titleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:self.titleButton];
    
    self.titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 9, 20, 12)];
    self.titleImageView.image = [UIImage imageNamed:@"向下箭头.png"];
    [titleView addSubview:self.titleImageView];
    
    self.navigationItem.titleView = titleView;
    
    self.titleArray = [NSMutableArray arrayWithObjects:@"全部订单", @"三个月内", @"一年内", @"更早",nil];
    self.titleNumArray = [NSMutableArray arrayWithObjects:@"100", @"40", @"35", @"25",nil];
    
    self.pullDownMenuView = [[CMPullDownMenuView alloc] initWithFrame:CGRectMake(0, 0, 375, 175) titleArray:self.titleArray titleNumArray:self.titleNumArray];
    self.pullDownMenuView.hidden = YES;
    
    __block RootViewController *weakSelf = self;
    __block UIButton *button = self.titleButton;
    self.pullDownMenuView.block = ^(NSString *str){
        if (![str isEqualToString:@""]) {
            [button setTitle:str forState:UIControlStateNormal];
        }
        [weakSelf changeTransformNO];
        button.selected = NO;
    };
    
    [self.view addSubview:self.pullDownMenuView];
}

- (void)titleButtonClick
{
    if (self.titleButton.selected == NO) {
        [self.pullDownMenuView showPullDownMenuView];
        [self changeTransformYES];
        self.titleButton.selected = YES;
    } else {
        [self.pullDownMenuView hiddenPullDownMenuView];
        [self changeTransformNO];
        self.titleButton.selected = NO;
    }
    
    
}

- (void)changeTransformYES
{
    self.pullDownMenuView.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        CGAffineTransform transform= CGAffineTransformMakeRotation(M_PI);
        self.titleImageView.transform = transform;//旋转
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)changeTransformNO
{
    [UIView animateWithDuration:0.3 animations:^{
        CGAffineTransform transform= CGAffineTransformMakeRotation(0);
        self.titleImageView.transform = transform;//旋转
    } completion:^(BOOL finished) {
        self.pullDownMenuView.hidden = YES;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

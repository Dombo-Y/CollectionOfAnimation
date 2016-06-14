//
//  PieMenuViewController.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/6/7.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "PieMenuViewController.h"
#import "PieMenuView.h"
#import "PieView.h"
@interface PieMenuViewController ()

@end

@implementation PieMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PieMenuView * pieMenuView = [[PieMenuView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    pieMenuView.backgroundColor =[UIColor greenColor];
    pieMenuView.center = self.view.center;
    [self.view addSubview:pieMenuView];
    
    
    PieView * pieView = [[PieView alloc] initWithFrame:CGRectMake(0, 0,100 ,100)];
    [self.view addSubview:pieView];
    pieView.layer.masksToBounds = YES;
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

//
//  ZoomAnimationViewController.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/4/29.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "ZoomAnimationViewController.h"

@interface ZoomAnimationViewController ()

@end

#define kHeight  [[UIScreen mainScreen] bounds].size.height
#define kWidth   [[UIScreen mainScreen] bounds].size.width
@implementation ZoomAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    for (NSInteger i = 0; i<12; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat btnSize = kWidth/4;
        btn.frame = CGRectMake(30 + (btnSize+10)*(i%3), 50 + (btnSize+10)*(i/3), kWidth/4, kWidth/4);
        [self.view addSubview:btn];
        btn.layer.borderWidth = 1;
        btn.tag = i + 1;
        btn.layer.borderColor = [UIColor colorWithRed:161/255.0 green:180/255.0f blue:68/255.0f alpha:1].CGColor;
        btn.backgroundColor = [UIColor colorWithRed:235/255.0f green:235/255.0f blue:235/255.0f alpha:1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)clickButton:(UIButton*)btn{
    NSLog(@"%ld",(long)btn.tag);
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse animations:^{
        btn.transform = CGAffineTransformMakeScale(1.2, 1.3);
    } completion:^(BOOL finished) {
        btn.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}
@end

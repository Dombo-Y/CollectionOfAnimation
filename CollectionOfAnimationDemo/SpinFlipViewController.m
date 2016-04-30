//
//  SpinFlipViewController.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/4/29.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "SpinFlipViewController.h"

@interface SpinFlipViewController ()

@end

#define kHeight  [[UIScreen mainScreen] bounds].size.height
#define kWidth   [[UIScreen mainScreen] bounds].size.width
@implementation SpinFlipViewController

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
/*
 CGFloat m11（x缩放）, m12（y切变）, m13（）, m14（）;
 CGFloat m21（x切变）, m22（y缩放）, m23（）, m24（）;
 CGFloat m31（）, m32（）, m33（）, m34（透视效果，要操作的这个对象要有旋转的角度，否则没有效果。当然,z方向上得有变化才会有透视效果）;
 CGFloat m41（x平移）, m42（y平移）, m43（z平移）, m44（）;
 */
- (void)clickButton:(UIButton*)btn{
    if (btn.tag%2>0) {
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             CATransform3D transForm =CATransform3DIdentity;
                             transForm.m34 = 0.0005;
                             transForm = CATransform3DMakeRotation(0.78, 0, 0, 1);// 45π/180 = 45 （ 3.1415 ） / 180 = 0.7853
                             [btn.layer setTransform:transForm];
                         } completion:^(BOOL finished) {
                         }];
    }else{
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             CATransform3D transForm =CATransform3DIdentity;
                             transForm.m34 = 0.0005;
                             transForm = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);// 45π/180 = 45 （ 3.1415 ） / 180 = 0.7853
                             [btn.layer setTransform:transForm];
                         } completion:^(BOOL finished) {
                         }];
    }

}

@end

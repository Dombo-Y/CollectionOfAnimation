//
//  3DAnimationViewController.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/4/29.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "ThreeDAnimationViewController.h"

@interface ThreeDAnimationViewController ()

@end
#define kHeight  [[UIScreen mainScreen] bounds].size.height
#define kWidth   [[UIScreen mainScreen] bounds].size.width
@implementation ThreeDAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    for (NSInteger i = 0; i<4; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat btnSize = kWidth/3;
        btn.frame = CGRectMake(30 + (btnSize+10)*(i%2), 50 + (btnSize+10)*(i/2), kWidth/3, kWidth/3);
        [self.view addSubview:btn];
        btn.layer.borderWidth = 1;
        btn.tag = i + 1;
        [btn setImage:[UIImage imageNamed:@"111"] forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"%ld",(long)btn.tag] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        btn.layer.borderColor = [UIColor colorWithRed:161/255.0 green:180/255.0f blue:68/255.0f alpha:1].CGColor;
        btn.backgroundColor = [UIColor colorWithRed:235/255.0f green:235/255.0f blue:235/255.0f alpha:1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)clickButton:(UIButton*)btn{
    if (btn.tag == 1) {
        CATransition *anima = [CATransition animation];
        anima.type = @"cube";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        [btn.layer addAnimation:anima forKey:@"revealAnimation"];
    }else if(btn.tag == 2){
        CATransition *anima = [CATransition animation];
        anima.type = kCATransitionPush;
        anima.subtype = kCATransitionFromRight;
        anima.duration = 1.0f;
        [btn.layer addAnimation:anima forKey:@"pushAnimation"];
    }else if (btn.tag == 3){
        CATransition *anima = [CATransition animation];
        anima.type = @"oglFlip";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        [btn.layer addAnimation:anima forKey:@"oglFlipAnimation"];
    }else if (btn.tag == 4){
        CATransition *anima = [CATransition animation];
        anima.type = @"suckEffect";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        [btn.layer addAnimation:anima forKey:@"suckEffectAnimation"];
    }
}
@end

//
//  TaoBaoPopUpViewController.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/6/14.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "TaoBaoPopUpViewController.h"

@interface TaoBaoPopUpViewController (){
    UIView * _popView;
    
    UIViewController *_rootVC;
    UIView *_rootView;
    
    UIView *_maskView;
}

@end

@implementation TaoBaoPopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    _popView =  ({
        UIView *popView = [[UIView alloc] initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 2)];
        
        popView.backgroundColor = [UIColor grayColor];
        popView.layer.shadowColor = [UIColor blackColor].CGColor;
        popView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        popView.layer.shadowRadius = 5;
        
        
        UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(15, 0, 50, 40);
        [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [closeBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:110/255.0 blue:90/255.0 alpha:1] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(clickCloseBtn) forControlEvents:UIControlEventTouchUpInside];
        [popView addSubview:closeBtn];
        
        popView;
    });
    
    
    _rootVC = [[UIViewController alloc] init];
    _rootVC.view.frame = self.view.bounds;
    _rootVC.view.backgroundColor = [UIColor whiteColor];
    _rootVC.view.layer.borderWidth = 1;
    _rootView = _rootVC.view;
    [self addChildViewController:_rootVC];
    [self.view addSubview:_rootView];
    
    _maskView = ({
        UIView * maskView = [[UIView alloc] initWithFrame:self.view.bounds];
        maskView.backgroundColor = [UIColor greenColor];
        maskView.alpha = 0;
        maskView;
    });
    [_rootView addSubview:_maskView];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"弹出" forState:UIControlStateNormal];
    [_rootVC.view addSubview:btn];
    btn.frame  = CGRectMake(0,400, 100, 64);
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)clickBtn{
    NSLog(@"弹出");
    [[UIApplication sharedApplication].windows[0] addSubview:_popView];
    
    CGRect frame = _popView.frame;
    
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - _popView.frame.size.height;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [_rootView.layer setTransform:[self firstTransform]];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [_rootView.layer setTransform:[self secondTransform]];
            //显示maskView
            [_maskView setAlpha:0.5f];

            //popView上升
            _popView.frame = frame;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];
}

- (void)clickCloseBtn{
    NSLog(@"关闭");
    
    CGRect frame = _popView.frame;
    frame.origin.y += _popView.frame.size.height;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [_maskView setAlpha:0.f];
        
        _popView.frame = frame;
        
        
        [_rootView.layer setTransform:[self firstTransform]];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            [_rootView.layer setTransform:CATransform3DIdentity];
        } completion:^(BOOL finished) {
            
            [_popView removeFromSuperview];
        }];
    }];
}



- (CATransform3D)firstTransform{
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    //带点缩小的效果
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    //绕x轴旋转
    t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1, 0, 0);
    return t1;
    
}

- (CATransform3D)secondTransform{
    
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = [self firstTransform].m34;
    //向上移
    t2 = CATransform3DTranslate(t2, 0, self.view.frame.size.height * (-0.08), 0);
    //第二次缩小
    t2 = CATransform3DScale(t2, 0.8, 0.8, 1);
    return t2;
}

@end

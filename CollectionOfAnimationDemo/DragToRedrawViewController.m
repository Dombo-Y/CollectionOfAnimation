//
//  DragToRedrawViewController.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/4/30.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "DragToRedrawViewController.h"
#import "DragToRedView.h"

@interface DragToRedrawViewController ()<
UIGestureRecognizerDelegate
>{
    CGPoint _redViewCenter;
    CGPoint _drawViewCenter;
    DragToRedView  * _view;
}

@end

@implementation DragToRedrawViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    DragToRedView  * view = [[DragToRedView alloc] initWithFrame:self.view.frame];
    view.backgroundColor =[UIColor whiteColor];
    self.view = view;
    
    
    UILabel * aLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:aLabel];
    aLabel.center = self.view.center;
    aLabel.text = @"拖拽";
    aLabel.textAlignment = NSTextAlignmentCenter;
    aLabel.layer.borderWidth = 1;
//    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
//    longPress.delegate = self;
    aLabel.userInteractionEnabled = YES;
//    [aLabel addGestureRecognizer:longPress];
    
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    pan.delegate = self;
    [pan setMaximumNumberOfTouches:1]; // 最小手指数
    [aLabel addGestureRecognizer:pan];
    _drawViewCenter = aLabel.center;
    
    
    UIView * redPointView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    redPointView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redPointView];
    redPointView.center = CGPointMake(self.view.center.x, 100);
    redPointView.layer.cornerRadius = redPointView.bounds.size.width / 2;
    _redViewCenter = redPointView.center;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pan:(UIGestureRecognizer*)panView{
      UILabel * tempLabel = (UILabel*)panView.view;
    CGPoint touchPoint = [panView locationInView:self.view];
    
    tempLabel.center = CGPointMake(touchPoint.x, touchPoint.y);
    _drawViewCenter = tempLabel.center;
    NSLog(@"%@", NSStringFromCGPoint(_drawViewCenter));
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}


- (void)longPress:(UIGestureRecognizer*)longPressView{
    UILabel *tempLabel =(UILabel*) longPressView.view;
    NSLog(@"%@",NSStringFromCGPoint(tempLabel.center));
    if (longPressView.state == UIGestureRecognizerStateBegan) {
    
    }else if (longPressView.state == UIGestureRecognizerStateChanged){
        
    }
}

@end

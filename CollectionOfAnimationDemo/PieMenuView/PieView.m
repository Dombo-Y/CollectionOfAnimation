//
//  PieView.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/6/7.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "PieView.h"
#import <math.h>
@implementation PieView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 1;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
///////////画扇形方法一：
//    UIColor*aColor = [UIColor redColor];//[UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    /*画扇形和椭圆*/
//    //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
//    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
//    //以10为半径围绕圆心画指定角度扇形
//    CGContextMoveToPoint(context, 160, 180);
//    CGContextAddArc(context, 160, 180, 30,  -60 * M_PI / 180, -120 * M_PI / 180, 1);
//    CGContextClosePath(context);
//    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
//    CGContextFillPath(context);
    
    
/////// 画扇形方法二：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    CGFloat scale = [@30 intValue]/(3 * 1.0);
    
    CGFloat startAngle = 0;
    
    CGFloat centerx  = rect.size.width/2.0;
    CGFloat centery  = rect.size.height/2.0;
    CGFloat radius   = centerx;
    CGFloat endAngle = startAngle + 0.3 * 2 * M_PI;
    //起始位置
    CGContextMoveToPoint(context, centerx, centery);
    //真正的绘制在这里
    CGContextAddArc(context, centerx, centery, radius, startAngle, endAngle, 0);

    //渲染
    CGContextFillPath(context);

    
///////画扇形方法三：
    //// Oval Drawing
//    CGRect ovalRect = CGRectMake(62, 19, 51, 51);
//    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
//    [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: 271 * M_PI/180 endAngle: 0 * M_PI/180 clockwise: YES];
//    [ovalPath addLineToPoint: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect))];
//    [ovalPath closePath];
//    
//    [UIColor.grayColor setFill];
//    [ovalPath fill];
}


@end

//
//  DragToRedView.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/4/30.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "DragToRedView.h"

@implementation DragToRedView

- (void)drawRect:(CGRect)rect{
    //获得处理的上下文
    CGContextRef
    context = UIGraphicsGetCurrentContext();
    
    //指定直线样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    //直线宽度
    CGContextSetLineWidth(context,
                          2.0);
    
    //设置颜色
    CGContextSetRGBStrokeColor(context,
                               0.314, 0.486, 0.859, 1.0);
    
    //开始绘制
    CGContextBeginPath(context);
    
    //画笔移动到点(31,170)
    CGContextMoveToPoint(context,
                         _redViewCenter.x, _redViewCenter.y);
    
    //下一点
    CGContextAddLineToPoint(context,
                            _drawViewCenter.x,_drawViewCenter.y);
    
    //绘制完成
    CGContextStrokePath(context);

}

@end

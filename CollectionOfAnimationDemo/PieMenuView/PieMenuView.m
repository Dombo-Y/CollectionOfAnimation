//
//  PieMenuView.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/6/7.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "PieMenuView.h"

@implementation PieMenuView{
    UITapGestureRecognizer *_tapGestureRecognizer;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = frame.size.width/2;
        self.layer.borderWidth = 1;
        
        
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:_tapGestureRecognizer];
    }
    return self;
}


- (void)tapAction:(UITapGestureRecognizer*)tap{
    NSLog(@"点击");
}
@end

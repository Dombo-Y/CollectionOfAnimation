//
//  ThumbUpAnimationViewController.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/4/30.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "ThumbUpAnimationViewController.h"
#import "MCFireworksView.h"
#import "MCFireworksButton.h"
#import "DCPathButton.h"
#import "DCPathItemButton.h"
@interface ThumbUpAnimationViewController ()<
DCPathButtonDelegate
>

@end

@implementation ThumbUpAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    MCFireworksButton *btn = [MCFireworksButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(0, 0, 50, 50);
    btn.center = CGPointMake(self.view.center.x/2, self.view.center.y/2);
    
    btn.particleImage = [UIImage imageNamed:@"Sparkle"];
    btn.particleScale = 0.05;
    btn.particleScaleRange = 0.02;
    [btn setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self ConfigureDCPathButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleButtonPress:(UIButton*)sender{
    sender.selected = !sender.selected;
    MCFireworksButton *btn = (MCFireworksButton*)sender;
    if (sender.selected) {
        [btn popInsideWithDuration:0.5];
        [btn setImage:[UIImage imageNamed:@"Like-Blue"] forState:UIControlStateNormal];
        [btn animate];
    }else{
        [btn popInsideWithDuration:0.4];
        [btn setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    }
}





- (void)ConfigureDCPathButton{
    DCPathButton *dcPathButton = [[DCPathButton alloc] initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"] hilightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    dcPathButton.delegate = self;
   
    
    
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]
                                      initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                      highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                      backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                      backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]
                                      initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                      highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                      backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                      backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]
                                      initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                      highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                      backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                      backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]
                                      initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                      highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                      backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                      backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc]
                                      initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                      highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                      backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                      backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
 
   [dcPathButton addPathItems:@[itemButton_1, itemButton_2, itemButton_3, itemButton_4, itemButton_5]];
    [self.view addSubview:dcPathButton];
    
}

- (void)itemButtonTappedAtIndex:(NSUInteger)index{
    NSLog(@"You tap at index : %ld", index);

}
@end

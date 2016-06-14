//
//  MainTableViewController.m
//  CollectionOfAnimationDemo
//
//  Created by yindongbo on 16/4/29.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "MainTableViewController.h"
#import <stdarg.h>
@interface MainTableViewController ()

@property(nonatomic, strong) NSMutableArray *titles;
@property(nonatomic, strong) NSMutableArray *className;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[].mutableCopy;
    self.className = @[].mutableCopy;
    
    [self addCell:@"缩放" class:@"ZoomAnimationViewController"];
    [self addCell:@"旋转/翻转" class:@"SpinFlipViewController"];
    [self addCell:@"3D动画效果" class:@"ThreeDAnimationViewController"];
    [self addCell:@"点赞动画" class:@"ThumbUpAnimationViewController"];
    [self addCell:@"拖动重绘" class:@"DragToRedrawViewController"];
    [self addCell:@"扇形菜单" class:@"PieMenuViewController"];
    [self addCell:@"淘宝弹出效果" class:@"TaoBaoPopUpViewController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addCell:(NSString*)title class:(NSString*)className{
    [self.titles addObject:title];
    [self.className addObject:className];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *claseeName = self.className[indexPath.row];
    Class class = NSClassFromString(claseeName);
    if (class) {
        UIViewController *vc = class.new;
        vc.title = _titles[indexPath.row];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.edgesForExtendedLayout = NO;
        [self.navigationController pushViewController:vc animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

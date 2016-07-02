//
//  CALayerViewController.m
//  ImageWithModeCutLayer
//
//  Created by chenyufeng on 7/2/16.
//  Copyright © 2016 chenyufengweb. All rights reserved.
//

#import "CALayerViewController.h"
#import "Masonry.h"
#import <CoreGraphics/CoreGraphics.h>

@interface CALayerViewController ()

@property (nonatomic, strong) UIView *redView;

@end

@implementation CALayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.redView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 200, 200)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
    }];

    // 使用layer属性设置圆角
    self.redView.layer.cornerRadius = 10;

    // 使用layer添加边框
    self.redView.layer.borderColor = [[UIColor blackColor] CGColor];
    self.redView.layer.borderWidth = 5;

    // 可以通过修改layer的背景颜色从而修改UIView的背景颜色
    self.redView.layer.backgroundColor = [[UIColor yellowColor] CGColor];

    // 修改透明度
    self.redView.layer.opacity = 0.5;

    // 设置View的阴影
    self.redView.layer.shadowColor = [[UIColor blueColor] CGColor];
    self.redView.layer.shadowOffset = CGSizeMake(10, 10);
    self.redView.layer.shadowOpacity = 1.0; // 一定要设置阴影的透明度，因为默认为0
    self.redView.layer.shadowRadius = 10;


}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    CALayer *redLayer = self.redView.layer;

    NSLog(@"redView.bounds = %@,redLayer.bounds = %@",NSStringFromCGRect(self.redView.bounds),NSStringFromCGRect(redLayer.bounds));
    NSLog(@"redView.center = %@,redLayer.position = %@",NSStringFromCGPoint(self.redView.center),NSStringFromCGPoint(redLayer.position));
    NSLog(@"redLayer.zPosition = %f",redLayer.zPosition);
    NSLog(@"redLayer.anchorPoint = %@",NSStringFromCGPoint(redLayer.anchorPoint));
    NSLog(@"redView.frame = %@,redLayer.frame = %@",NSStringFromCGRect(self.redView.frame),NSStringFromCGRect(redLayer.frame));


}


@end

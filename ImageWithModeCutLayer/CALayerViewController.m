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

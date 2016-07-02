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

@property (nonatomic, strong) UIImageView *redView;
@property (nonatomic, strong) UIImage *fordImage;

@end

@implementation CALayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.redView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 200, 200)];
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


    // 设置超过layer区域部分是否截掉
    self.redView.layer.masksToBounds = NO;


    /**
     *  在ImageView中加入一张图片
     self.redView.layer.masksToBounds = YES;时可以把超出layer部分截掉。
     */
    self.fordImage = [UIImage imageNamed:@"ford"];
    self.redView.contentMode = UIViewContentModeScaleAspectFill;
    self.redView.image = self.fordImage;

    // hidden设置为YES会隐藏Layer，视图不可见
    self.redView.layer.hidden = NO;


    // 由于self.view是redView的父视图，所以self.view.layer同样也是redView.layer的父图层
    CALayer *superLayer = self.redView.layer.superlayer;
    CALayer *selfViewLayer = self.view.layer;
    NSLog(@"superLayer = %@,selfViewLayer = %@",superLayer,selfViewLayer);

    // 子视图, 打断点可以看到子图层的详细参数，可以看到UIView是作为Layer的delegate。
    NSArray *subLayerArray = self.view.layer.sublayers;
    NSLog(@"self.view.layer.sublayers = %@",subLayerArray);



    // contents,layer中存放的内容，这里返回的是CGImage类型
    id layerContent = self.redView.layer.contents;
    NSLog(@"self.redView.layer.contents = %@",layerContent);
    NSLog(@"self.redView.layer.contentsRect = %@",NSStringFromCGRect(self.redView.layer.contentsRect));
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

    NSLog(@"fordImage.size = %@",NSStringFromCGSize(self.fordImage.size)); // 图片的原始大小
}


@end

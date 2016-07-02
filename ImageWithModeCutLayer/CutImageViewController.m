//
//  CutImageViewController.m
//  ImageWithModeCutLayer
//
//  Created by chenyufeng on 7/2/16.
//  Copyright © 2016 chenyufengweb. All rights reserved.
//

#import "CutImageViewController.h"
#import "Masonry.h"

@interface CutImageViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CutImageViewController

/**
 *  原始图片大小：380*140
 */
- (void)viewDidLoad
{
    [super viewDidLoad];

#if 0
    // 原始的显示图片，默认的contentMode为ContentModeScaleToFill
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.imageView setImage:[UIImage imageNamed:@"ford"]];
    self.imageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
    }];
#endif









}


//裁剪图片
- (UIImage *)cutImage:(UIImage*)originImage
{
    //压缩图片
    CGSize newImageSize;
    CGImageRef imageRef = nil;

    CGSize imageViewSize = self.imageView.frame.size;
    CGSize originImageSize = originImage.size;

    if ((originImageSize.width / originImageSize.height) < (imageViewSize.width / imageViewSize.height))
    {
        // imageView的宽高比 > image的宽高比
        newImageSize.width = originImageSize.width;
        newImageSize.height = originImageSize.width * imageViewSize.height / imageViewSize.width;

        imageRef = CGImageCreateWithImageInRect([originImage CGImage], CGRectMake(0, fabs(originImageSize.height - newImageSize.height) / 2, newImageSize.width, newImageSize.height));
    }
    else
    {
        // image的宽高比 > imageView的宽高比
        newImageSize.height = originImageSize.height;
        newImageSize.width = originImageSize.height * imageViewSize.width / imageViewSize.height;

        imageRef = CGImageCreateWithImageInRect([originImage CGImage], CGRectMake(fabs(originImageSize.width - newImageSize.width) / 2, 0, newImageSize.width, newImageSize.height));
    }

    return [UIImage imageWithCGImage:imageRef];
}


@end

//
//  ImageCollectionViewCell.m
//  ImageWithModeCutLayer
//
//  Created by chenyufeng on 6/30/16.
//  Copyright © 2016 chenyufengweb. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "Masonry.h"

@interface ImageCollectionViewCell()

@end

@implementation ImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor yellowColor];

        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        self.imageView.layer.masksToBounds = YES;
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];

        self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 320, 20)];
        self.descLabel.textAlignment = NSTextAlignmentCenter;
        self.descLabel.textColor = [UIColor whiteColor];
        [self.descLabel setFont:[UIFont systemFontOfSize:13]];
        [self addSubview:self.descLabel];
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(5);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.equalTo(@20);
        }];
    }
    return self;
}

@end

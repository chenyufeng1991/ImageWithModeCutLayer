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
        [self addSubview:self.imageView];

        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];


    }
    return self;
}

@end

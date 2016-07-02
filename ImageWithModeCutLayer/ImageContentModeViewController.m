//
//  ImageContentModeViewController.m
//  ImageWithModeCutLayer
//
//  Created by chenyufeng on 6/30/16.
//  Copyright © 2016 chenyufengweb. All rights reserved.
//

#import "ImageContentModeViewController.h"
#import "ImageCollectionViewCell.h"

@interface ImageContentModeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSMutableArray *collectionViewArray;
@property (nonatomic, strong) NSMutableArray *imageContentModeArray;
@property (nonatomic, strong) NSMutableArray *contentModeDescArray;

@end

/**
 typedef NS_ENUM(NSInteger, UIViewContentMode) {
 UIViewContentModeScaleToFill,
 UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
 UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
 UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
 UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
 UIViewContentModeTop,
 UIViewContentModeBottom,
 UIViewContentModeLeft,
 UIViewContentModeRight,
 UIViewContentModeTopLeft,
 UIViewContentModeTopRight,
 UIViewContentModeBottomLeft,
 UIViewContentModeBottomRight,
 };
 */
@implementation ImageContentModeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Image ContentMode";

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    self.myCollectionView = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:flow];
    self.myCollectionView.backgroundColor = [UIColor blackColor];
    [self.myCollectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"ImageCollectionViewCell"];
    self.myCollectionView.delegate = self;
    self.myCollectionView.dataSource = self;
    [self.view addSubview:self.myCollectionView];

    self.collectionViewArray = [[NSMutableArray alloc] initWithCapacity:13];
    self.imageContentModeArray = [[NSMutableArray alloc] initWithCapacity:13];
    for (int i = 0; i < 13 ; i++)
    {
        // 原图像大小：380*140
        [self.collectionViewArray addObject:[UIImage imageNamed:@"ford"]];
        [self.imageContentModeArray addObject:[NSNumber numberWithInt:i]];
    }

    self.contentModeDescArray = [[NSMutableArray alloc] initWithCapacity:13];
    [self.contentModeDescArray addObject:@"ContentModeScaleToFill"];
    [self.contentModeDescArray addObject:@"ContentModeScaleAspectFit"];
    [self.contentModeDescArray addObject:@"ContentModeScaleAspectFill"];
    [self.contentModeDescArray addObject:@"ContentModeRedraw"];
    [self.contentModeDescArray addObject:@"ContentModeCenter"];
    [self.contentModeDescArray addObject:@"ContentModeTop"];
    [self.contentModeDescArray addObject:@"ContentModeBottom"];
    [self.contentModeDescArray addObject:@"ContentModeLeft"];
    [self.contentModeDescArray addObject:@"ContentModeRight"];
    [self.contentModeDescArray addObject:@"ContentModeTopLeft"];
    [self.contentModeDescArray addObject:@"ContentModeTopRight"];
    [self.contentModeDescArray addObject:@"ContentModeBottomLeft"];
    [self.contentModeDescArray addObject:@"ContentModeBottomRight"];


}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionViewArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionViewCell" forIndexPath:indexPath];

    cell.imageView.image = self.collectionViewArray[indexPath.row];
    cell.imageView.contentMode = [self.imageContentModeArray[indexPath.row] integerValue];
    cell.descLabel.text = self.contentModeDescArray[indexPath.row];

    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(180, 180);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 60.0f;
}

@end

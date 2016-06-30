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

@end

@implementation ImageContentModeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Image ContentMode";

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    self.myCollectionView = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:flow];
    self.myCollectionView.backgroundColor = [UIColor whiteColor];
    [self.myCollectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"ImageCollectionViewCell"];
    self.myCollectionView.delegate = self;
    self.myCollectionView.dataSource = self;
    [self.view addSubview:self.myCollectionView];

    self.collectionViewArray = [[NSMutableArray alloc] initWithCapacity:12];
    for (int i = 0; i < 12 ; i++)
    {
        [self.collectionViewArray addObject:[UIImage imageNamed:@"ford"]];
    }
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionViewArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionViewCell" forIndexPath:indexPath];

    if (cell == nil)
    {
        cell = [[ImageCollectionViewCell alloc] init];
    }

    cell.imageView.image = self.collectionViewArray[indexPath.row];

    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}

@end

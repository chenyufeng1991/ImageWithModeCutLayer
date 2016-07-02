//
//  ViewController.m
//  ImageWithModeCutLayer
//
//  Created by chenyufeng on 6/30/16.
//  Copyright © 2016 chenyufengweb. All rights reserved.
//

#import "MainViewController.h"
#import "ImageContentModeViewController.h"
#import "CutImageViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *tableViewArray;

@end

/**
 *  讲解关于图片的填充模式contentMode,图片裁剪；
    和View的Layer属性讲解
 */
@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"主界面";
    self.tableViewArray = [[NSArray alloc] initWithObjects:@"缩放",@"裁剪", nil];
    self.myTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];

}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableViewArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];

    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
    }

    cell.textLabel.text = self.tableViewArray[indexPath.row];

    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    switch (indexPath.row) {
        case 0:
        {
            ImageContentModeViewController *vc = [[ImageContentModeViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        case 1:
        {
            CutImageViewController *vc = [[CutImageViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        default:
            break;
    }
}



@end

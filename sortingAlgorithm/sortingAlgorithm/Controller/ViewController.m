//
//  ViewController.m
//  sortingAlgorithm
//
//  Created by 姜梓烯 on 2016/7/9.
//  Copyright (c) 2016 jiangzixi. All rights reserved.
//


#import "ViewController.h"
#import "SortingTypeVC.h"
#import "Macro.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];

}

- (void)setupUI {
    //布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kCellWidth, kCellWidth);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor colorWithRed:kRadom green:kRadom blue:kRadom alpha:1];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:collectionView];
}

#pragma mark - collectionView dataSource&delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *lable;
    for (UIView *view in cell.contentView.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            lable = (UILabel *) view;
        }
    }
    if (!lable) {
        lable = [UILabel new];
        lable.layer.cornerRadius = 5;
        lable.layer.masksToBounds = YES;
        lable.textAlignment = NSTextAlignmentCenter;
        lable.textColor = [UIColor whiteColor];
        lable.font = [UIFont systemFontOfSize:28];
        lable.frame = CGRectMake(0, 0, kCellWidth, kCellWidth);
        [cell.contentView addSubview:lable];
        lable.backgroundColor = [UIColor colorWithRed:kRadom green:kRadom blue:kRadom alpha:1];
    }
    switch (indexPath.row) {
        case 0: {
            lable.text = @"排序";
            break;
        }
        case 1: {
            lable.text = @"树";
            break;
        }
        case 2: {
            lable.text = @"图";
            break;
        }
        default:
            lable.text = @"error";
            break;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SortingTypeVC *typeVC = [[SortingTypeVC alloc] init];
    //选中哪个
    typeVC.type = indexPath.row;
    [self.navigationController pushViewController:typeVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
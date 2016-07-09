//
// Created by 姜梓烯 on 2016/7/9.
// Copyright (c) 2016 jiangzixi. All rights reserved.
//

#import "SortingTypeVC.h"
#import "SortingDetailVC.h"


@interface SortingTypeVC () <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) NSArray *nameArr;

@end

@implementation SortingTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    switch (_type) {
        case 0:{
            //排序
            _nameArr = @[@"冒泡排序",@"快速排序",@"二叉排序树"];
            break;
        }
        case 1:{
            break;
        }
        case 2:{
            break;
        }
        default:break;
    }

    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"table"];
    [self.view addSubview:tableView];


}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"table"];
    cell.textLabel.text = _nameArr[(NSUInteger) indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SortingDetailVC *detailVC = [[SortingDetailVC alloc] init];
    detailVC.sortType = _type;
    detailVC.algorithmType = indexPath.row;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
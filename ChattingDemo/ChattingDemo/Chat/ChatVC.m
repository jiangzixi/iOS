//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatVC.h"
#import "ToolBarView.h"

@interface ChatVC() <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *table;
@property(nonatomic, strong) ToolBarView *toolBarView;

@end

@implementation ChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTable) name:kToolBarViewChangeHeighNotification object:nil];

    _table = [[UITableView alloc] initWithFrame:CGRectMake(0,0,PHONEWIDTH,PHONEHEIGHT-50) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.backgroundColor = RGBA(235,235,235,1);
    _table.tableFooterView = [UIView new];
    [self.view addSubview:_table];

    _toolBarView = [[ToolBarView alloc] initWithFrame:CGRectMake(0,PHONEHEIGHT-50,PHONEWIDTH,50)];
    [self.view addSubview:_toolBarView];


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_toolBarView resetFrame];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)changeTable{
    _table.height = PHONEHEIGHT-_toolBarView.height;
}


@end
//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatVC.h"
#import "ToolBarView.h"
#import "ChatTextCell.h"
#import "ChatMsgModel.h"
#import "ChatCellFrameModel.h"

@interface ChatVC () <UITableViewDelegate, UITableViewDataSource, ToolBarViewDelegate>

@property(nonatomic, strong) UITableView *table;
@property(nonatomic, strong) ToolBarView *toolBarView;
@property(nonatomic, strong) NSMutableArray<ChatCellFrameModel *> *dataArr;

@end

@implementation ChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self initChatData];

    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, PHONEWIDTH, PHONEHEIGHT - 50) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.alwaysBounceVertical = YES;
    _table.backgroundColor = RGBA(235, 235, 235, 1);
    _table.tableFooterView = [UIView new];
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_table registerClass:[ChatTextCell class] forCellReuseIdentifier:@"textCell"];
    [self.view addSubview:_table];

    _toolBarView = [[ToolBarView alloc] initWithFrame:CGRectMake(0, PHONEHEIGHT - 50, PHONEWIDTH, 50)];
    _toolBarView.delegate = self;
    [self.view addSubview:_toolBarView];


}

- (void)initChatData {
    _dataArr = [NSMutableArray array];
    ChatMsgModel *msg1 = [[ChatMsgModel alloc] init];
    msg1.fromId = kMYCHATID;
    msg1.time = @"1451145600";
    msg1.toId = kOTHERCHATID;
    msg1.msgType = @"0";
    msg1.msgContent = @"生日快乐！";
    ChatCellFrameModel *frameModel1 = [ChatCellFrameModel frameModelWith:msg1 timeStr:[self TimeDifferenceTransformation:msg1.time]];
    [_dataArr addObject:frameModel1];

    ChatMsgModel *msg2 = [[ChatMsgModel alloc] init];
    msg2.fromId = kMYCHATID;
    msg2.time = @"1451145690";
    msg2.toId = kOTHERCHATID;
    msg2.msgType = @"0";
    msg2.msgContent = @"惊讶吗？";
    ChatCellFrameModel *frameModel2 = [ChatCellFrameModel frameModelWith:msg2 timeStr:nil];
    [_dataArr addObject:frameModel2];

    ChatMsgModel *msg3 = [[ChatMsgModel alloc] init];
    msg3.fromId = kOTHERCHATID;
    msg3.time = @"1451169923";
    msg3.toId = kMYCHATID;
    msg3.msgType = @"0";
    msg3.msgContent = @"谢谢";
    ChatCellFrameModel *frameModel3 = [ChatCellFrameModel frameModelWith:msg3 timeStr:[self TimeDifferenceTransformation:msg3.time]];
    [_dataArr addObject:frameModel3];

    ChatMsgModel *msg4 = [[ChatMsgModel alloc] init];
    msg4.fromId = kOTHERCHATID;
    msg4.time = @"1451169935";
    msg4.toId = kMYCHATID;
    msg4.msgType = @"0";
    msg4.msgContent = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    ChatCellFrameModel *frameModel4 = [ChatCellFrameModel frameModelWith:msg4 timeStr:nil];
    [_dataArr addObject:frameModel4];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatTextCell *textCell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
    textCell.frameModel = _dataArr[indexPath.row];
//    ChatMsgModel *msgModel = _dataArr[indexPath.row];
//    ChatMsgModel *lastModel;
//    NSString *timeStr;
//    if (indexPath.row!=0 && indexPath.row+1>=_dataArr.count) {
//        lastModel = _dataArr[indexPath.row-1];
//    }
//    if (lastModel) {
//        if ([self compareTimeDate:msgModel.time date2:lastModel.time]) {
//            timeStr = [self TimeDifferenceTransformation:msgModel.time];
//        }
//    }
//    ChatCellFrameModel *frameModel = [ChatCellFrameModel frameModelWith:msgModel timeStr:timeStr];
//    textCell.frameModel = frameModel;

    return textCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _dataArr[indexPath.row].cellHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    [_toolBarView resetFrame];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_toolBarView resetFrame];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)compareTimeDate:(NSString *)str date2:(NSString *)str2 {
    NSString *datestring = [NSDate dateWithTimeInterval:str.floatValue format:@"YYYY/MM/dd HH:mm:ss"];
    NSString *datestring2 = [NSDate dateWithTimeInterval:str2.floatValue format:@"YYYY/MM/dd HH:mm:ss"];
    NSDateFormatter *dm = [[NSDateFormatter alloc] init];
    [dm setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    NSDate *newdate = [dm dateFromString:datestring];
    NSDate *newdate2 = [dm dateFromString:datestring2];
    long dd = (long) [newdate timeIntervalSince1970] - [newdate2 timeIntervalSince1970];
    return dd / 120 < 1;
}

- (NSString *)TimeDifferenceTransformation:(NSString *)str {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];
    NSString *datestring = [NSDate dateWithTimeInterval:str.longLongValue format:@"yyyy/MM/dd HH:mm:ss"];
    NSDateFormatter *dm = [[NSDateFormatter alloc] init];
    [dm setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate *newdate = [dm dateFromString:datestring];
    long dd = [datenow timeIntervalSince1970] - str.longLongValue;
    NSString *timeString = @"";
    if (dd / 86400 > 1) {
        timeString = [NSDate dateWithTimeInterval:str.floatValue format:@"yyyy/MM/dd HH:mm"];
    } else {
        timeString = [NSDate dateWithTimeInterval:str.floatValue format:@"HH:mm"];
    }
    return timeString;
}

- (void)scrollToBottomWithAnimation:(BOOL)animation {
    if (_table.contentSize.height>_table.height-64) {
        [_table setContentOffset:CGPointMake(0,_table.contentSize.height-_table.height) animated:YES];
    }
}

- (void)toolBarDidChangeFrame:(CGRect)frame {
    if (_toolBarView.y != 0) {
        _table.height = _toolBarView.y;
        [self scrollToBottomWithAnimation:YES];
    }
}

- (void)addATextMsg:(NSString *)string {
    ChatMsgModel *msg = [[ChatMsgModel alloc] init];
    msg.fromId = kMYCHATID;
    msg.time = [NSString stringWithFormat:@"%.0f", [[NSDate date] timeIntervalSince1970]];
    msg.toId = kOTHERCHATID;
    msg.msgType = @"0";
    msg.msgContent = string;
    NSString *timeStr;
    if (_dataArr.lastObject) {
        if ([self compareTimeDate:msg.time date2:_dataArr.lastObject.msgModel.time]) {
            timeStr = [self TimeDifferenceTransformation:msg.time];
        }
    }
    ChatCellFrameModel *frameModel = [ChatCellFrameModel frameModelWith:msg timeStr:timeStr];
    [_dataArr addObject:frameModel];
    [_table reloadData];
}

@end
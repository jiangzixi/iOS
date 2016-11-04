//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatVC.h"
#import "ToolBarView.h"
#import "ChatTextCell.h"
#import "ChatMsgModel.h"
#import "ChatCellFrameModel.h"
#import "MoreFunctionView.h"
#import "ChatImageCell.h"

@interface ChatVC () <UITableViewDelegate, UITableViewDataSource, ToolBarViewDelegate, MoreFunctionDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(nonatomic, strong) UITableView *table;
@property(nonatomic, strong) ToolBarView *toolBarView;
@property(nonatomic, strong) MoreFunctionView *functionView;
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
    [_table registerClass:[ChatImageCell class] forCellReuseIdentifier:@"imageCell"];
    [self.view addSubview:_table];

    _toolBarView = [[ToolBarView alloc] initWithFrame:CGRectMake(0, PHONEHEIGHT - 50, PHONEWIDTH, 50)];
    _toolBarView.delegate = self;
    [self.view addSubview:_toolBarView];

    _functionView = [[MoreFunctionView alloc] initWithFrame:CGRectMake(0, _toolBarView.bottomY, PHONEWIDTH, moreViewHeigh)];
    _functionView.delegate = self;
    [self.view addSubview:_functionView];


}

- (void)initChatData {
    _dataArr = [NSMutableArray array];

    ChatMsgModel *msg3 = [[ChatMsgModel alloc] init];
    msg3.fromId = kOTHERCHATID;
    msg3.time = @"1451169923";
    msg3.toId = kMYCHATID;
    msg3.msgType = chatMsgTypeText;
    msg3.msgContent = @"谢谢";
    ChatCellFrameModel *frameModel3 = [ChatCellFrameModel frameModelWith:msg3 timeStr:[self handleTimeStr:msg3]];
    [_dataArr addObject:frameModel3];

    ChatMsgModel *msg4 = [[ChatMsgModel alloc] init];
    msg4.fromId = kOTHERCHATID;
    msg4.time = @"1451169935";
    msg4.toId = kMYCHATID;
    msg4.msgType = chatMsgTypeText;
    msg4.msgContent = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    ChatCellFrameModel *frameModel4 = [ChatCellFrameModel frameModelWith:msg4 timeStr:[self handleTimeStr:msg4]];
    [_dataArr addObject:frameModel4];

    ChatMsgModel *msg1 = [[ChatMsgModel alloc] init];
    msg1.fromId = kMYCHATID;
    msg1.time = @"1551145600";
    msg1.toId = kOTHERCHATID;
    msg1.msgType = chatMsgTypeText;
    msg1.msgContent = @"生日快乐！";
    ChatCellFrameModel *frameModel1 = [ChatCellFrameModel frameModelWith:msg1 timeStr:[self handleTimeStr:msg1]];
    [_dataArr addObject:frameModel1];

    ChatMsgModel *msg2 = [[ChatMsgModel alloc] init];
    msg2.fromId = kMYCHATID;
    msg2.time = @"1551145690";
    msg2.toId = kOTHERCHATID;
    msg2.msgType = chatMsgTypeText;
    msg2.msgContent = @"嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻";
    ChatCellFrameModel *frameModel2 = [ChatCellFrameModel frameModelWith:msg2 timeStr:nil];
    [_dataArr addObject:frameModel2];
//    ChatMsgModel *msg5 = [[ChatMsgModel alloc] init];
//    msg5.fromId = kMYCHATID;
//    msg5.time = @"145117321";
//    msg5.toId = kOTHERCHATID;
//    msg5.msgType = chatMsgTypeImage;
//    msg5.msgContent = @"6661478278059.png";
//    ChatCellFrameModel *frameModel5 = [ChatCellFrameModel frameModelWith:msg5 timeStr:[self handleTimeStr:msg5]];
//    [_dataArr addObject:frameModel5];
//
//    ChatMsgModel *msg6 = [[ChatMsgModel alloc] init];
//    msg6.fromId = kMYCHATID;
//    msg6.time = @"145117321";
//    msg6.toId = kOTHERCHATID;
//    msg6.msgType = chatMsgTypeImage;
//    msg6.msgContent = @"6661478283051.png";
//    ChatCellFrameModel *frameModel6 = [ChatCellFrameModel frameModelWith:msg6 timeStr:[self handleTimeStr:msg6]];
//    [_dataArr addObject:frameModel6];
//
//
//    [_dataArr addObject:frameModel5];
//    [_dataArr addObject:frameModel5];
//    [_dataArr addObject:frameModel5];
//    [_dataArr addObject:frameModel5];
//    [_dataArr addObject:frameModel6];
//    [_dataArr addObject:frameModel6];
//    [_dataArr addObject:frameModel6];
//    [_dataArr addObject:frameModel6];
//    [_dataArr addObject:frameModel6];
//    [_dataArr addObject:frameModel6];
//    [_dataArr addObject:frameModel5];


    [self scrollToBottomWithAnimation:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatCellFrameModel *frameModel = _dataArr[indexPath.row];
    if (frameModel.msgModel.msgType == chatMsgTypeText) {
        ChatTextCell *textCell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
        textCell.frameModel = frameModel;
        return textCell;
    } else if (frameModel.msgModel.msgType == chatMsgTypeImage) {
        ChatImageCell *imageCell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
        imageCell.frameModel = frameModel;
        return imageCell;
    }

    return UITableViewCell.new;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_toolBarView resetFrame];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)scrollToBottomWithAnimation:(BOOL)animation {
    [_table reloadData];
    if (_table.contentSize.height > _table.height - 64) {
        [_table setContentOffset:CGPointMake(0, _table.contentSize.height - _table.height) animated:animation];
    }
}

- (void)toolBarDidChangeFrame:(CGRect)frame {
    if (_toolBarView.y != 0) {
        _table.height = _toolBarView.y;
        _functionView.y = _toolBarView.bottomY;
        [self scrollToBottomWithAnimation:YES];
    }
}

- (void)addATextMsg:(NSString *)string {
    ChatMsgModel *msg = [[ChatMsgModel alloc] init];
    msg.fromId = kMYCHATID;
    msg.time = [NSString stringWithFormat:@"%.0f", [[NSDate date] timeIntervalSince1970]];
    msg.toId = kOTHERCHATID;
    msg.msgType = chatMsgTypeText;
    msg.msgContent = string;
    ChatCellFrameModel *frameModel = [ChatCellFrameModel frameModelWith:msg timeStr:[self handleTimeStr:msg]];
    [_dataArr addObject:frameModel];
    [_table reloadData];
}

- (NSString *)handleTimeStr:(ChatMsgModel *)msg {
    if (_dataArr.lastObject) {
        if (![NSDate compareTimeDate:msg.time date2:_dataArr.lastObject.msgModel.time]) {
            return nil;
        }
    }
    return [NSDate TimeDifferenceTransformation:msg.time];
}

#pragma mark - moreViewDelegate

- (void)moreFunctionSelectPicBtn:(UIButton *)button {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:^{

    }];

}

#pragma mark - imagepickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> *)info {
    if ([info[UIImagePickerControllerMediaType] isEqualToString:@"public.image"]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
        NSString *imageName = [NSString stringWithFormat:@"%@%.0f.png", kMYCHATID, time];
        NSString *imagePath = [kCHATIMAGEFOLDERPATH stringByAppendingPathComponent:imageName];
        NSData *imagePngData = UIImagePNGRepresentation(image);
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        // 判断文件夹是否存在，如果不存在，则创建
        if (![[NSFileManager defaultManager] fileExistsAtPath:kCHATIMAGEFOLDERPATH]) {
            [fileManager createDirectoryAtPath:kCHATIMAGEFOLDERPATH withIntermediateDirectories:YES attributes:nil error:nil];
        }
        if ([imagePngData writeToFile:imagePath atomically:YES]) {
            NSLog(@"%@", imagePath);
            ChatMsgModel *model = [[ChatMsgModel alloc] init];
            model.fromId = kMYCHATID;
            model.toId = kOTHERCHATID;
            model.time = [NSString stringWithFormat:@"%.0f", time];
            model.msgType = chatMsgTypeImage;
            model.msgContent = imageName;
            ChatCellFrameModel *frameModel = [ChatCellFrameModel frameModelWith:model timeStr:[self handleTimeStr:model]];
            [_dataArr addObject:frameModel];
            [_table reloadData];
        } else {
            NSLog(@"你的存储空间不足!");
        }
    }
    [picker dismissViewControllerAnimated:YES completion:^{

    }];
}

@end
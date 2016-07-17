//
// Created by 姜梓烯 on 2016/7/9.
// Copyright (c) 2016 jiangzixi. All rights reserved.
//

#import "SortingDetailVC.h"
#import "Macro.h"
#import "SortAlgorithmDetail.h"

@interface SortingDetailVC ()

//显示的富文本
@property(strong, nonatomic) NSMutableArray *textArr;
//界面中的label
@property(strong, nonatomic) NSMutableArray *labelArr;
@property(strong, nonatomic) NSTimer *timer;
//算法类的单例
@property(strong, atomic) SortAlgorithmDetail *sort;

@end

@implementation SortingDetailVC

- (void)loadView {
    //让视图可以滑动
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.contentSize = CGSizeMake(0,1024);
    self.view = scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _sort = [SortAlgorithmDetail shareSortAlgorithm];
    //判断进行哪种操作
    switch (_sortType) {
        case 0: {
            switch (_algorithmType){
                case 0:{
                    //排序里面的冒泡
                    [self sortByBubble];
                    break;
                }
                case 1:{
                    //排序里面的二叉排序树
                    [SortAlgorithmDetail binarySortTree];
                }
                default:break;
            }
            break;
        }
        case 1:{
            break;
        }
        case 2:{
            break;
        }
        default:
            break;
    }
}

#pragma mark - 冒泡算法
- (void)sortByBubble {
    _labelArr = [NSMutableArray array];
    //使用子线程排序,不阻塞UI线程
    dispatch_async(dispatch_get_global_queue(0,0),^{
        _textArr = [SortAlgorithmDetail sortingByBubble];
        //需要显示
        if (_textArr.count>0) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeLabelText:) userInfo:nil repeats:YES];
        }
    });

}
/**在界面中显示排序顺序*/
- (void)changeLabelText:(NSTimer *)timer {
    //判断还有没有需要显示的文字
    if (_textArr.count > 0) {
        UILabel *label;
        if (_labelArr.count > 0) {
            UILabel *last = _labelArr.lastObject;
            label = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(last.frame) + 3, kPhoneWidth - 20, 20)];
        } else {
            label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kPhoneWidth - 20, 20)];
        }
        label.attributedText = _textArr[0];
        [_textArr removeObjectAtIndex:0];
        [_labelArr addObject:label];
        [self.view addSubview:label];
    } else {
        if (_labelArr.count>0) {
            [timer invalidate];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
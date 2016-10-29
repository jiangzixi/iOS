//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ToolBarView.h"

@interface ToolBarView () <UITextViewDelegate>

@property(nonatomic, strong) UIButton *voiceBtn;
@property(nonatomic, strong) UIButton *addBtn;
@property(nonatomic, assign) BOOL isShowMore;

@end


@implementation ToolBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    self.backgroundColor = RGBA(245, 245, 246, 1);

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, PHONEWIDTH, 1)];
    topLine.backgroundColor = RGBA(215, 215, 217, 1);
    [self addSubview:topLine];

    _voiceBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 30, 30)];
    _voiceBtn.centerY = self.height / 2;
    [_voiceBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
    [_voiceBtn addTarget:self action:@selector(changeToVoiceBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_voiceBtn];

    _inputView = [[UITextView alloc] initWithFrame:CGRectMake(_voiceBtn.rightX + 5, 0, PHONEWIDTH - 84, 36)];
    _inputView.centerY = self.height / 2;
    _inputView.font = [UIFont systemFontOfSize:15];
    _inputView.textColor = [UIColor blackColor];
    _inputView.delegate = self;
    _inputView.layer.cornerRadius = 5;
    _inputView.layer.borderColor = topLine.backgroundColor.CGColor;
    _inputView.layer.borderWidth = 1;
    _inputView.layer.masksToBounds = YES;
    [self addSubview:_inputView];

    _addBtn = [[UIButton alloc] initWithFrame:CGRectMake(PHONEWIDTH - 30 - 5, 0, 30, 30)];
    _addBtn.centerY = self.height / 2;
    [_addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [_addBtn addTarget:self action:@selector(moreBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addBtn];

}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    _voiceBtn.y = frame.size.height - 30 - 11;
    _addBtn.y = frame.size.height - 30 - 11;
    [[NSNotificationCenter defaultCenter] postNotificationName:kToolBarViewChangeHeighNotification object:nil];
}


#pragma mark - button

- (void)changeToVoiceBtn {

}

- (void)moreBtn {
    _isShowMore = !_isShowMore;
        if (!_isShowMore) {
            //需要隐藏条，显示键盘
            [_inputView becomeFirstResponder];
        } else {
            //显示条
            [_inputView resignFirstResponder];
            [UIView animateWithDuration:0.25 animations:^{
                self.y = PHONEHEIGHT-self.height-moreViewHeigh;
            }];
        }
//    }
}

- (void)resetFrame {
    if (_isShowMore) {
        [UIView animateWithDuration:0.25 animations:^{
            self.y = PHONEHEIGHT - self.height;
        }];
        _isShowMore=NO;
    } else {
        [_inputView resignFirstResponder];
    }
}

#pragma mark - textviewdelegate

- (void)textViewDidChange:(UITextView *)textView {
    //处理输入框变化
    CGSize maxSize = CGSizeMake(textView.width, CGFLOAT_MAX);
    NSDictionary *attribute = @{NSFontAttributeName: textView.font};
    CGSize retSize = [textView.text boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    if (textView.height + 18 != retSize.height || textView.height == 36 || textView.height == 100) {
        CGFloat oldHeigh = self.height;
        if (retSize.height <= 82) {
            textView.height = retSize.height + 18;
            self.height = textView.height + 16;
        } else {
            textView.height = 100;
            self.height = 114;
        }
        textView.centerY = self.height / 2;
        _voiceBtn.bottomY = self.height - 10;
        _addBtn.y = _voiceBtn.y;
        CGFloat change = oldHeigh-self.height;
        self.y = self.y+change;
    }
}

#pragma mark keyBoard

- (void)keyBoardWillHide:(NSNotification *)notification {
    if (_isShowMore) {
        return;
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            self.y = PHONEHEIGHT-self.height;
        }];
    }
}

- (void)keyBoardWillShow:(NSNotification *)notification {
    _isShowMore = NO;
    NSDictionary *userInfo = [notification userInfo];
    NSValue* aValue = userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    [UIView animateWithDuration:0.25 animations:^{
        self.y = PHONEHEIGHT-keyboardRect.size.height-self.height;
    }];

}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
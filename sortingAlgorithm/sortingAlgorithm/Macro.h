//
// Created by 姜梓烯 on 2016/7/9.
// Copyright (c) 2016 jiangzixi. All rights reserved.
//

#ifndef Macro_h

#define Macro_h


/**屏幕宽度*/
#define kPhoneWidth [UIScreen mainScreen].bounds.size.width
/**屏幕高度*/
#define kPhoneHeight [UIScreen mainScreen].bounds.size.height
/**cell宽度*/
#define kCellWidth (kPhoneWidth-15)/2
/**0-1随机数*/
#define kRadom (float)(arc4random()%100)/100

#endif
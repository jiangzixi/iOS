//
// Created by 姜梓烯 on 2016/7/9.
// Copyright (c) 2016 jiangzixi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SortAlgorithmDetail : NSObject

/**单例*/
+ (instancetype)shareSortAlgorithm;
/**冒泡排序*/
+ (NSMutableArray *)sortingByBubble;
@end
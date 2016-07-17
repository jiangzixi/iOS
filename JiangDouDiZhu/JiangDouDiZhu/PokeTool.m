//
//  PokeTool.m
//  JiangDouDiZhu
//
//  Created by 姜梓烯 on 16/6/13.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#import "PokeTool.h"

@implementation PokeTool

+ (PokeTool *)sharedTool {
    static PokeTool *tool = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        tool = [[self alloc] init];
    });
    return tool;
}

- (NSMutableArray *)newPoke{
    //总牌
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i<4; i++) {
        for (int j = 1; j<14; j++) {
            PokeModel *model = [[PokeModel alloc] init];
            model.number = j;
            model.type = i;
            [arr addObject:model];
        }
    }
    for (int i =0; i<2; i++) {
        PokeModel *model = [[PokeModel alloc] init];
        model.number = i;
        model.type = ghost;
        [arr addObject:model];
    }
    return arr;
}
- (NSMutableDictionary *)shuffleWithPoke:(NSMutableArray *)arr{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (int j = 1; j < 4; j++) {
        NSMutableArray *player = [NSMutableArray array];
        for (int i = 0; i < 17; i++) {
            NSInteger number = arc4random()%arr.count;
            [player addObject:arr[number]];
            [arr removeObjectAtIndex:number];
        }
        [dictionary setObject:player forKey:[NSString stringWithFormat:@"player%d",j]];
    }
    [dictionary setObject:arr forKey:@"host"];
    return dictionary;
}

@end

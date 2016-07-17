//
//  PokeTool.h
//  JiangDouDiZhu
//
//  Created by 姜梓烯 on 16/6/13.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PokeModel.h"

@interface PokeTool : NSObject

+ (PokeTool *)sharedTool;

- (NSMutableArray *)newPoke;

- (NSMutableDictionary *)shuffleWithPoke:(NSMutableArray *)arr;
@end

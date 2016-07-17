//
//  PokeModel.h
//  JiangDouDiZhu
//
//  Created by 姜梓烯 on 16/6/13.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    block,
    club,
    heart,
    spade,
    ghost
}pokeType;

@interface PokeModel : NSObject

@property(assign,nonatomic) BOOL hadOut;//判断是否已出牌
@property(assign,nonatomic) NSInteger number;//牌号
@property(assign,nonatomic) pokeType type;

@end

//
//  UITableViewCell+ZXExt.m
//  HosUser
//
//  Created by jiang on 2016/9/26.
//  Copyright © 2016年 hope.bridge. All rights reserved.
//

#import "UITableViewCell+ZXExt.h"

@implementation UITableViewCell (ZXExt)

- (void)initMyUI {
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t *thisProperty = propertyList + i;
        NSString *propertyName = @(property_getName(*thisProperty));
        if ([propertyName hasSuffix:@"Lbl"]) {
            [self setValue:[UILabel new] forKey:propertyName];
        } else if ([propertyName hasSuffix:@"Img"]) {
            [self setValue:[UIImageView new] forKey:propertyName];
        } else if ([propertyName hasSuffix:@"Btn"]) {
            [self setValue:[UIButton new] forKey:propertyName];
        }else if ([propertyName hasSuffix:@"View"]) {
            [self setValue:[UIView new] forKey:propertyName];
        }
        if ([[self valueForKey:propertyName] isKindOfClass:[UIView class]]) {
            [self addToView:propertyName];
        }
    }
    free(propertyList);
}

- (void)addToView:(NSString *)propertyName{
    UIView *view = [self valueForKey:propertyName];
    [self.contentView addSubview:view];
}

@end

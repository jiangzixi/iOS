//
//  ViewController.m
//  Runtime
//
//  Created by 姜梓烯 on 2016/7/2.
//  Copyright (c) 2016 tempRT. All rights reserved.
//


#import "ViewController.h"
#import <objc/runtime.h>

//动态添加的方法的实现
void dynamicAddMyMethod(id self,SEL _cmd){
    NSLog(@"addMyMethodSuccess!");
}


@interface ViewController ()

@property(nonatomic, strong) id propertyName;

@property(strong, nonatomic) NSString *originalReceiver;
@property(strong, nonatomic) NSString *theNewReceiver;

@end

@implementation ViewController

//需要手动写set和get
@dynamic propertyName;

- (void)viewDidLoad {
    [super viewDidLoad];
    //尽管self(发送消息指向的目标)和_cmd(接受消息的)没有被明确声明，在源代码中我们仍然可以引用它们
    NSLog(@"Current method:%@ %@\n",self.class,NSStringFromSelector(_cmd));


    //struct objc_super { id receiver; Class class; };
    //self作为objc_super的receiver去执行,class方法是属于NSObject类的,所以最终是
    //objc_msgSend(objc_super->receiver, @selector(class))
    //输出的还是当前类
    NSLog(@"%@",super.class);

    //没写set和get会挂掉
//    self.propertyName = [[NSObject alloc] init];

    //IMP指针为函数的指针
    //除非是需要持续大量重复调用某方法的极端情况，避开消息发送泛滥而直接调用该方法会更高效
    [self performSelector:@selector(addMyMethod)];

    _originalReceiver = @"old";
    _theNewReceiver = @"new";

    //将消息接受者进行偷梁换柱
    [self performSelector:@selector(changeReceiver:)];
//    [self changeReceiver:_originalReceiver];
}

//偷梁换柱
//- (void)changeReceiver:(NSString *)receiver {
//    NSLog(@"%@",receiver);
//}


+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(addMyMethod)) {
        //动态添加方法
        class_addMethod(self.class,sel,(IMP)dynamicAddMyMethod,"v@:");
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(changeReceiver:)) {
        return _theNewReceiver;
    }
    return [super forwardingTargetForSelector:aSelector];
}

//- (void)setPropertyName:(id)propertyName {
//    NSLog(@"%@",NSStringFromSelector(_cmd));
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end


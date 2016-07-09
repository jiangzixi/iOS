//
//  ViewController.m
//  Runtime
//
//  Created by 姜梓烯 on 2016/7/2.
//  Copyright (c) 2016 tempRT. All rights reserved.
//


#import "ViewController.h"
#import "NewRecevierObject.h"
#import "AppDelegate.h"
#import <objc/runtime.h>

//动态添加的方法的实现
void dynamicAddMyMethod(id self,SEL _cmd){
    NSLog(@"addMyMethodSuccess!");
}


@interface ViewController ()

@property(nonatomic, strong) id propertyName;

@end

@implementation ViewController

//需要手动写set和get
@dynamic propertyName;

- (void)viewDidLoad {
    [super viewDidLoad];
    //发送者和接受者流程图片
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"respondsToSelector.png"]];
    imageView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:imageView];

    //尽管self(发送消息指向的目标)和_cmd(接受消息的)没有被明确声明，在源代码中我们仍然可以引用它们
    NSLog(@"Current method:%@ %@\n",self.class,NSStringFromSelector(_cmd));

    //struct objc_super { id receiver; Class class; };
    //self作为objc_super的receiver去执行,class方法是属于NSObject类的,所以最终是
    //objc_msgSend(objc_super->receiver, @selector(class))
    //输出的还是当前类
    NSLog(@"%@",super.class);

    //没写set和get会挂掉
    self.propertyName = [[NSObject alloc] init];

    //IMP指针为函数的指针
    //除非是需要持续大量重复调用某方法的极端情况，避开消息发送泛滥而直接调用该方法会更高效
    [self performSelector:@selector(addMyMethod)];

    //将消息接受者进行偷梁换柱
    [self performSelector:@selector(changeReceiver)];

}

//如果没找到selector之后先走这个方法,这个方法是NSObject的方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    ViewController *vc = (ViewController *) appdelegate.window.rootViewController;
    if (sel == @selector(addMyMethod)) {
        //动态添加方法
        class_addMethod(self.class,sel,(IMP)dynamicAddMyMethod,"v@:");
    }
    BOOL result = [super resolveInstanceMethod:sel];
    NSLog(@"%d-----%@",result,NSStringFromSelector(sel));
    return result;
}
//如果上面的方法ruturn了一个NO后还是无法响应方法的时候
- (id)forwardingTargetForSelector:(SEL)aSelector {
    id normalReturnKey = [super forwardingTargetForSelector:aSelector];
    NSLog(@"%@-----%@",normalReturnKey,NSStringFromSelector(aSelector));
    if (aSelector == @selector(changeReceiver)) {
        return [[NewRecevierObject alloc] init];
    }
    return normalReturnKey;
}
//
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel rangeOfString:@"set"].location == 0) {
        //动态造一个 setter函数
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    } else {
        //动态造一个 getter函数
        return [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    //拿到函数名
    NSString *key = NSStringFromSelector([anInvocation selector]);
    if ([key rangeOfString:@"set"].location == 0) {
        //setter函数形如 setXXX: 拆掉 set和冒号
        key = [[key substringWithRange:NSMakeRange(3, [key length]-4)] lowercaseString];

    } else {
        //getter函数就相对简单了，直接把函数名做key就好了。
        NSObject *object = [self valueForKey:key];
        [anInvocation setReturnValue:&object];
    }
}



//- (void)setPropertyName:(id)propertyName {
//    NSLog(@"%@",NSStringFromSelector(_cmd));
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end


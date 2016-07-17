//
//  ViewController.m
//  JiangDouDiZhu
//
//  Created by 姜梓烯 on 16/6/13.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#import "ViewController.h"
#import "PokeTool.h"

@interface ViewController ()

@property(strong, nonatomic) PokeTool *tool;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tool = [PokeTool sharedTool];
    NSDictionary *pokeDic = [_tool shuffleWithPoke:[_tool newPoke]];

    for (int i = 1; i < 4; ++i) {
        UILabel *number = [[UILabel alloc] initWithFrame:CGRectMake(0,66+i*60,375,20)];
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(0,86+i*60,375,20)];
        NSString *numberStr = @"";
        NSString *typeStr = @"";
        NSString *key = [NSString stringWithFormat:@"player%d",i];
        NSMutableArray *array = [pokeDic objectForKey:key];
        for (PokeModel *model in array){
            numberStr = [numberStr stringByAppendingFormat:@"%2d ",model.number];
            typeStr = [typeStr stringByAppendingFormat:@"%2d",model.type];
        }
        number.text = numberStr;
        type.text = typeStr;
        number.textColor = [UIColor blackColor];
        type.textColor = [UIColor blackColor];
        [self.view addSubview:number];
        [self.view addSubview:type];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

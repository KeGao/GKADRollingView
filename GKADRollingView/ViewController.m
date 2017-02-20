//
//  ViewController.m
//  GKADRollingView
//
//  Created by Gao on 2017/2/16.
//  Copyright © 2017年 gao. All rights reserved.
//

#import "ViewController.h"
#import "GKAdView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupGKAdView];
}

- (void)setupGKAdView {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        GKAdModel *model = [[GKAdModel alloc] init];
        model.title = @"热门";
        model.content = [NSString stringWithFormat:@"点击了广告%d把这条广告对应的模型传递过来",i];
        model.path = [NSString stringWithFormat:@"ad%d",i];
        [arr addObject:model];
    }
    
    GKAdView *v = [[GKAdView alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width-100, 40)];
//    v.layer.borderWidth = 1;
    v.clickAdBlock = ^(NSString *path) {
        NSLog(@"这里只打印部分信息===%@",path);
    };
    v.modelArr = arr;
    [self.view addSubview:v];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

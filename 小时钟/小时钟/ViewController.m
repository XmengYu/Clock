//
//  ViewController.m
//  小时钟
//
//  Created by xmy on 16/8/25.
//  Copyright © 2016年 xmy. All rights reserved.
//

#import "ViewController.h"
#import "XMYClock.h"

@interface ViewController ()
@property(weak,nonatomic)CALayer *lay;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    XMYClock *clockView = [[XMYClock alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:clockView];
    [clockView updateTime];
    
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

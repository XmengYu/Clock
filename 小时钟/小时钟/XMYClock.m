//
//  XMYClock.m
//  小时钟
//
//  Created by xmy on 16/8/25.
//  Copyright © 2016年 xmy. All rights reserved.
//

#import "XMYClock.h"

@interface XMYClock ()
@property(weak,nonatomic)CALayer *lay;

@end
@implementation XMYClock

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}



//添加时钟
- (void)setupUI
{
    CALayer *lock = [[CALayer alloc]init];
    
    //表盘的位置可修改
    lock.position = CGPointMake(200, 200);
    
    lock.bounds = self.frame;
    
    lock.contents = (__bridge id _Nullable)([UIImage imageNamed:@"clock"].CGImage);
    //切圆角
    lock.cornerRadius = self.bounds.size.width * 0.5;
    
    lock.masksToBounds = YES;
    
    
    //创建指针
    CALayer *lay = [[CALayer alloc]init];
    lay.position = lock.position;
    
    /**
     *  @param 2   表针的宽  可以调整
     *
     */
    lay.bounds = CGRectMake(0, 0, 2, self.bounds.size.width*0.5);
    lay.backgroundColor = [UIColor blackColor].CGColor;
    //
    lay.anchorPoint = CGPointMake(0.3, 0.7);
    self.lay = lay;
    
    
    
    //注意添加的前后位置,会影响他的层次结构
    //添加表盘
    [self.layer addSublayer:lock];
    //添加指针
    [self.layer addSublayer:lay];
    
    
    
    //实现动画
    //第一种方法
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
    
    //始终上来会快速的跑一次
    [self updateTime];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTime)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    
}

//1秒钟会刷新60次
- (void)updateTime{
    
    //获取系统时间
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    
    //通过日历获取秒数
    NSInteger secound = [calendar component:NSCalendarUnitSecond fromDate:[NSDate date]];
    
    
    //获取旋转角度  360 / 60
    CGFloat angle = M_PI * 2 / 60 * secound;
    
    self.lay.affineTransform = CGAffineTransformMakeRotation(angle);
    
    
    
}

@end

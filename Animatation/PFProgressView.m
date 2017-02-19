//
//  PFProgressView.m
//  Animatation
//
//  Created by 小飞 on 17/2/19.
//  Copyright © 2017年 小飞. All rights reserved.
//

#import "PFProgressView.h"
// 加载时显示的文字
NSString * const SDRotationLoopProgressViewWaitingText = @"LOADLING...";
@implementation PFProgressView

{
    CGFloat _angleInterval;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeAngle) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)changeAngle
{
    _angleInterval += M_PI * 0.08;
    if (_angleInterval >= M_PI * 2) _angleInterval = 0;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    [[UIColor orangeColor] set]; // 圈 颜色

    CGContextSetLineWidth(ctx, 4);
    CGFloat to = - M_PI * 0.06 + _angleInterval; // 初始值0.05
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - 10;
    CGContextAddArc(ctx, xCenter, yCenter, radius, _angleInterval, to, 0);
    CGContextStrokePath(ctx);

    // 加载时显示的文字
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:13 * MIN(self.frame.size.width, self.frame.size.height) / 100.0];
    attributes[NSForegroundColorAttributeName] = [UIColor orangeColor]; //文字颜色
    [self setCenterProgressText:SDRotationLoopProgressViewWaitingText withAttributes:attributes];
}


@end

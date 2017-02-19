//
//  PFbaseProgressView.m
//  Animatation
//
//  Created by 小飞 on 17/2/19.
//  Copyright © 2017年 小飞. All rights reserved.
//

#import "PFbaseProgressView.h"

@implementation PFbaseProgressView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = PFProgressViewBackgroundColor;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
    }
    return self;
}


-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    if (progress >= 1.0)
    {
        [self removeFromSuperview];
    }else{
        [self setNeedsDisplay];
    }
    
}

-(void)setCenterProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes{
    CGFloat xCenter = self.frame.size.width*0.5;
    CGFloat yCenter = self.frame.size.height*0.5;
    
//    判断系统版本号
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
    {
        CGSize strSize = [text sizeWithAttributes:attributes];
        CGFloat strX = xCenter - strSize.width * 0.5;
        CGFloat stry = yCenter - strSize.height * 0.5;
        [text drawAtPoint:CGPointMake(strX, stry) withAttributes:attributes];
    }else{
        CGSize strSize;
        NSAttributedString *attstr = nil;
        if (attributes[NSFontAttributeName])
        {
            strSize= [text sizeWithAttributes:attributes[NSFontAttributeName]];
            attstr = [[NSAttributedString alloc] initWithString:text attributes:attributes];
        }else{
            strSize = [text sizeWithFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
            attstr = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:[UIFont systemFontSize]]}];
        }
        CGFloat strX = xCenter - strSize.width * 0.5;
        CGFloat strY = yCenter - strSize.height * 0.5;
        [attstr drawAtPoint:CGPointMake(strX, strY)];
        
    }
}


// 清除指示器
- (void)dismiss
{
    self.progress = 1.0;
}


+ (id)progressView
{
    return [[self alloc] init];
}






@end

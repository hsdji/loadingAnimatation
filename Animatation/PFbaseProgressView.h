//
//  PFbaseProgressView.h
//  Animatation
//
//  Created by 小飞 on 17/2/19.
//  Copyright © 2017年 小飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define PFProgressViewBackgroundColor PFColorMaker(255, 255, 255, 0)  //控件背景色
#define PFColorMaker(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

@interface PFbaseProgressView : UIView
/**
 *     @author xiaofei, 17-02-19 19:02:56
 *
 *     @brief 当前所占的百分比最大为1.0最小我哦0.0；
 */
@property (nonatomic, assign) CGFloat progress;

/**
 *     @author xiaofei, 17-02-19 19:02:00
 *
 *     @brief 动画要显示文字以及文字的大小格式.......
 *
 *     @param text       要现实的文字
 *     @param attributes 字体的样式
 */
- (void)setCenterProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes;

/**
 *     @author xiaofei, 17-02-19 19:02:49
 *
 *     @brief 动画消失
 */
- (void)dismiss;
/**
 *     @author xiaofei, 17-02-19 19:02:12
 *
 *     @brief 创建动画
 *
 *     @return 动画view
 */
+ (id)progressView;
@end

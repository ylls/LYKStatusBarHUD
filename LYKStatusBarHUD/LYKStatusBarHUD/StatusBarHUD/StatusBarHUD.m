//
//  StatusBarHUD.m
//  StatusBarHUD
//
//  Created by 刘亚坤 on 16/5/9.
//  Copyright © 2016年 刘亚坤. All rights reserved.
//

#import "StatusBarHUD.h"
//统一字体
#define StatusBarHUDFount [UIFont systemFontOfSize:12]
#define StatusBarHUDColor [UIColor brownColor]
/** 状态栏消息停留时间 **/
static CGFloat const messageDuration = 2.0;
/** 状态显示/隐藏动画时间 **/
static CGFloat const animationDuration = 0.25;

@implementation StatusBarHUD

/** 全局窗口 **/
static UIWindow *window_;
/** 定时器 **/
static NSTimer *time_;
//显示窗口
+ (void)showWindow{
    //设置frame
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    //显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.backgroundColor = [UIColor darkGrayColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:animationDuration animations:^{
        window_.frame =frame;
    }];
}

/**
 *  显示自定义信息和图片
 *
 *  @param message 文字
 *  @param image   图片
 */
+ (void)showMessage:(NSString *)message showImage:(UIImage *)image{
    //停止定时器
    [time_ invalidate];
    //显示窗口
    [self showWindow];
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:message forState:UIControlStateNormal];
    button.titleLabel.font = StatusBarHUDFount;
    [button setTitleColor:StatusBarHUDColor forState:UIControlStateNormal];
    if (image) {//如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 1, 1);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    //定时器
    time_ = [NSTimer scheduledTimerWithTimeInterval:messageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  显示普通信息
 *  @param message 文字
 */
+ (void)showMessage:(NSString *)message{
    [self showMessage:message showImage:nil];
}

/**
 * 显示成功的信息
 *  @param message 文字
 */
+ (void)showSuccessMessage:(NSString *)message{
    [self showMessage:message showImage:[UIImage imageNamed:@"StatusBarHUD.bundle/sucess"]];
}

/**
 * 显示失败的信息
 *  @param message 文字
 */
+ (void)showErrprMessage:(NSString *)message{

    [self showMessage:message showImage:[UIImage imageNamed:@"StatusBarHUD.bundle/errro"]];

}

/**
 *  显示正在加载的信息
 *  @param message 文字
 */
+ (void)showLoadingMessage:(NSString *)message{
    //停止定时器
    [time_ invalidate];
    time_ = nil;
    //显示窗口
    [self showWindow];
    //添加文字
    UILabel *lable = [[UILabel alloc]init];
    lable.frame = window_.bounds;
    lable.font = StatusBarHUDFount;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = message;
    lable.textColor = StatusBarHUDColor;
    [window_ addSubview:lable];
    //添加小菊花
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    loadingView.color = StatusBarHUDColor;
    [loadingView startAnimating];
    //文字宽度
    CGFloat messageW = [message sizeWithAttributes:@{NSFontAttributeName:StatusBarHUDFount}].width;
    CGFloat centerX = (window_.frame.size.width - messageW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

/**
 *  隐藏状态栏
 */
+ (void)hide{
[UIView animateWithDuration:animationDuration animations:^{
    CGRect frame = window_.frame;
    frame.origin.y = - frame.size.height;
    window_.frame = frame;
} completion:^(BOOL finished) {
    window_ = nil;
    time_ = nil;
}];

}

@end

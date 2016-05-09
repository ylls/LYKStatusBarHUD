//
//  StatusBarHUD.h
//  StatusBarHUD
//
//  Created by 刘亚坤 on 16/5/9.
//  Copyright © 2016年 刘亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusBarHUD : NSObject
/**
 *  显示自定义信息和图片
 *
 *  @param message 文字
 *  @param image   图片
 */
+ (void)showMessage:(NSString *)message showImage:(UIImage *)image;

/**
 *  显示普通信息
 *  @param message 文字
 */
+ (void)showMessage:(NSString *)message;

/**
 * 显示成功的信息
 *  @param message 文字
 */
+ (void)showSuccessMessage:(NSString *)message;

/**
 * 显示失败的信息
 *  @param message 文字
 */
+ (void)showErrprMessage:(NSString *)message;

/**
 *  显示正在加载的信息
 *  @param message 文字
 */
+ (void)showLoadingMessage:(NSString *)message;

/**
 *  隐藏状态栏
 */
+ (void)hide;
@end

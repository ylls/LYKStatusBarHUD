//
//  ViewController.m
//  LYKStatusBarHUD
//
//  Created by 刘亚坤 on 16/5/9.
//  Copyright © 2016年 刘亚坤. All rights reserved.
//

#import "ViewController.h"
#import "StatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)success {
    [StatusBarHUD showSuccessMessage:@"加载成功"];
}

- (IBAction)error {
    [StatusBarHUD showErrprMessage:@"加载失败"];
}
- (IBAction)loading {
    [StatusBarHUD showLoadingMessage:@"正在加载"];
}
- (IBAction)custom {
    [StatusBarHUD showMessage:@"自定义" showImage:[UIImage imageNamed:@"check"]];
}
- (IBAction)hidn {
    [StatusBarHUD hide];
}

@end

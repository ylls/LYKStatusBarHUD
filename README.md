# LYKStatusBarHUD
简单的状态栏提示
##显示成功细信息
'''objc
[StatusBarHUD showSuccessMessage:@"加载成功"];
'''
##显示失败信息
'''objc
[StatusBarHUD showErrprMessage:@"加载失败"];
'''
##显示正在加载
'''objc
[StatusBarHUD showLoadingMessage:@"正在加载"];
'''
##显示自定义图片和文字信息
'''objc
[StatusBarHUD showMessage:@"自定义" showImage:[UIImage imageNamed:@"check"]];
'''
##隐藏
'''objc
[StatusBarHUD hide];
'''

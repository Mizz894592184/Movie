//
//  BaseNavigationController.m
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置navigatBar的标题
    NSDictionary *textAttributes = @{
         NSForegroundColorAttributeName:[UIColor lightGrayColor],
         NSFontAttributeName:[UIFont systemFontOfSize:20]
         
                                     };
    
    self.navigationBar.titleTextAttributes =textAttributes;
    
    
    
    
    
    //2 base中整体设置
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];

    // Do any additional setup after loading the view.
}

//状态栏的样式 (需要去plist文件添加)
-(UIStatusBarStyle)preferredStatusBarStyle{
//    UIStatusBarStyleDefault:黑色字体
//    UIStatusBarStyleLightContent:白色字体
    return UIStatusBarStyleLightContent;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

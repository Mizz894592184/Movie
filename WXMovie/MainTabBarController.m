//
//  MainTabBarController.m
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "MainTabBarController.h"
#import "WXTabBarButton.h"
#import "Common.h"


@interface MainTabBarController ()
{
    UIImageView *selectImageV; //选中滑块
}
@end

@implementation MainTabBarController
//视图已经加载完成后
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1 移除tabbarButton
//    [self _removeTabBarButton];
    
    
    //2 自定义TabBar
    [self _customTabBar];
    
    //3 自定义navigationBar
    [self _customNavigationBar];
    
    
    
    
    
    // Do any additional setup after loading the view.
}
//视图将要出现
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
/*
 写在viewDidLoad中失败的原因:
 在使用storyboard中搭建三级控制器的时候:
 在viewDidLaod中移除后,storyboard还没有加载完.当再加载二级控制器的时候,会从新给他添加上tabBar和btn.
 */
    
    [self _removeTabBarButton];


}

-(void)_removeTabBarButton{
    
    for (UIView *view in self.tabBar.subviews) {
        Class class =NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            
            [view removeFromSuperview];
            
        }
    }

}

-(void)_customTabBar{
    
    //1 背景图片
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg_all"];
    //2 标题
    NSArray *titles =@[@"首页",@"新闻",@"Top",@"影院",@"更多"];
    //3 button上的图片
    NSArray *imageNames =@[@"movie_home",@"msg_new",@"start_top250",@"icon_cinema",@"more_setting"];
    
    //4 button的宽度
    float buttonWidth =KScreenWidth/titles.count;
    
    //5 选中图片
    selectImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 55, 50)];
    selectImageV.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [self.tabBar addSubview:selectImageV];
    
    
    
//    6  创建5个button
    for (int i =0; i<titles.count; i++) {
        
        NSString *title = titles[i];
        NSString *imageName = imageNames[i];
        CGRect frame = CGRectMake(i*buttonWidth, 0, buttonWidth, 49);
        
        WXTabBarButton *button = [[WXTabBarButton alloc]initWithFrame:frame withImageName:imageName withTitle:title];
        button.tag = 1000+i;
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
       //当首次的时候,确定滑块的位置
        if (i ==0) {
            
            selectImageV.center = button.center;
        }
        
        [self.tabBar addSubview:button];
        
        
        
    }
    
    
}
-(void)buttonAction:(UIButton*)btn{
    
    //1 界面切换
    self.selectedIndex =btn.tag-1000;
    
    //2 滑块的切换
    [UIView animateWithDuration:0.3 animations:^{

            selectImageV.center = btn.center;
        
    }];

}

-(void)_customNavigationBar{
    
    //1 遍历每个导航控制器 5个navigationBar
//    for (UINavigationController *navi in self.viewControllers) {
//        
//        [navi.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
//        
//    }
    
    //2 使用appearance   UINavigationBar
    //作用:可以改变UINavigationBar的默认的样式.
    
    //只有改代码执行之后,默认的样式才改变
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    
    

    
    
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

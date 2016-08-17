//
//  GuideViewController.m
//  WXMovie
//
//  Created by bing on 16/7/29.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "GuideViewController.h"
#import "Common.h"
#import "MainTabBarController.h"
#import "AppDelegate.h"
@interface GuideViewController ()<UIScrollViewDelegate>

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createScrollView];
    
    // Do any additional setup after loading the view.
}
//创建滑动视图
-(void)_createScrollView{
    
    //创建滑动视图
    UIScrollView *scorllView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    //内容大小
    scorllView.contentSize =CGSizeMake(KScreenWidth*5, KScreenHeight);
    
    //分页效果
    scorllView.pagingEnabled = YES;
    
    scorllView.delegate =self;
    
    for (int i =0; i<5; i++) {
        
        //图片的名字
        NSString *imageName = [NSString stringWithFormat:@"guide%d",i+1];
        //进度条的名字
        NSString *progressName = [NSString stringWithFormat:@"guideProgress%d",i+1];
        
        //图片
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth*i, 0, KScreenWidth, KScreenHeight)];
        
        //进度条图片
        UIImageView *progressImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, KScreenHeight-27, KScreenWidth, 27)];
        
        imageV.image = [UIImage imageNamed:imageName];
        progressImageV.image = [UIImage imageNamed:progressName];
        //内容保持不变,定位调整
        progressImageV.contentMode = UIViewContentModeCenter;
        
        //添加
        [imageV addSubview:progressImageV];
        [scorllView addSubview:imageV];
        
        
    }
    
    [self.view addSubview:scorllView];
    

    
}

#pragma mark - UIScrollView Deleagete
//实时调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    
    if (scrollView.contentOffset.x>(KScreenWidth*4+50)) {
        
        //跳到主界面
            UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            MainTabBarController *tabBarC = [storyB instantiateInitialViewController];
        
        //加动画
        //(1)先缩小0.3倍
        tabBarC.view.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.5 animations:^{
            
            tabBarC.view.transform =CGAffineTransformIdentity;
        }];
        
        //复原
        
        //设置window的根视图
        //1 通过self.view获取window
        //self.view.window.rootViewController = tabBarC;
        
        //2 通过APPDelegate对象获取window
        //AppDelegate *appdelegate =  [UIApplication sharedApplication].delegate;
        //appdelegate.window.rootViewController = tabBarC;
        
        //3 直接获取
        [UIApplication sharedApplication].keyWindow.rootViewController = tabBarC;
        
        
        
        
    }
    
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

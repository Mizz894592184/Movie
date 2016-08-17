//
//  LauchViewController.m
//  WXMovie
//
//  Created by bing on 16/7/29.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "LauchViewController.h"
#import "Common.h"
#import "MainTabBarController.h"
@interface LauchViewController ()
{

    NSMutableArray *imageViews;//图片数组
    int count;//计数count
    
}
@end

@implementation LauchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    count = 0;
    
    self.view.backgroundColor = [UIColor orangeColor];
    [self _createBackImageView];
    
    [self _createImageViews];
    
    //2 定时器的调用
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(startAnimation:) userInfo:nil repeats:YES];
    
}
//创建背景图片
-(void)_createBackImageView{

    UIImageView *backImageV = [[UIImageView alloc]initWithFrame:self.view.bounds];
    backImageV.image = [UIImage imageNamed:@"Default"];
    
    [self.view addSubview:backImageV];
}

//定时器调用的方法
-(void)startAnimation:(NSTimer*)timer{

    if (count == imageViews.count) {
        
        //定时器停止
        [timer invalidate];
        
        //显示主界面
        UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        MainTabBarController *maintabBarC =[storyB instantiateInitialViewController];
        
        self.view.window.rootViewController = maintabBarC;
        
    }else{
    
        [UIView animateWithDuration:0.1 animations:^{
            
            UIImageView *imageV = imageViews[count];
            imageV.alpha = 1;
        }];
        
       
    }
  
    count++;
    
}
//创建图片视图
-(void)_createImageViews{
    
    //创建图片数组
    imageViews = [NSMutableArray array];
    
    CGFloat width = KScreenWidth/4;
    CGFloat height= KScreenHeight/6;
    
    CGFloat x = 0;
    CGFloat y = 0;
    
    //循环创建24张图片视图
    for (int i = 0; i<24; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"%d.png",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        
        imageView.alpha = 0;
        
        imageView.frame =CGRectMake(0, 0, width, height);
        
        if (i<4) {//前四张
            
            x = i*width;
            y = 0;
            
        }else if (i<8){//最右边的四张
            
            x =3*width;
            y =height*(i-3);
            
        }else if (i<12){//最下面的四张
            
            //x =KScreenWidth-width*1;
            x =KScreenWidth-width*(i-7);
            y = KScreenHeight-height;
            
        }else if (i<16){//最左边的四张
            
            x = 0;
            y = KScreenHeight-height*(i-10);
            
 
        }else if (i<18){//上边2个
        
            x = width*(i-15);
            y =height;
            
        }else if (i<20){//右边2个
        
            x = width*2;
            y = height*(i-16);
            
        }else if (i<22){//下面2个
        
            x = KScreenWidth-width*(i-18);
            y = KScreenHeight-height*2;
            
            
        }else if (i<24){//最后2个
        
            x = width;
            y = KScreenHeight-height*(i-19);
            
        }
        imageView.origin = CGPointMake(x, y);
        
        //按照顺序将图片放在图片数组中
        [imageViews addObject:imageView];
        
        [self.view addSubview:imageView];

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

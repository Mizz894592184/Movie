//
//  PhotoScrollView.m
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "PhotoScrollView.h"
#import "Common.h"
@implementation PhotoScrollView

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        imageV = [[UIImageView alloc]initWithFrame:self.bounds];
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageV];
        
        self.delegate = self;
        
        //最大 最小缩放倍数 (必须要写)
        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 2.0;
        
        
        //添加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        tap.numberOfTapsRequired = 2;//点击的次数
        tap.numberOfTouchesRequired = 1;//手指的个数
        //给scrollview添加一个手势
        [self addGestureRecognizer:tap];
        
    }
    return self;
}
-(void)tapAction:(UITapGestureRecognizer *)tap{

    if (self.zoomScale>1.0) {
        
        [self setZoomScale:1.0 animated:YES];
    }else{
    
        [self setZoomScale:2.0 animated:YES];
    }
  
    
    
    
}

-(void)setUrl:(NSString *)url{

    _url = url;
 
    [imageV sd_setImageWithURL:[NSURL URLWithString:url]];
    
}
//返回一个可以调节大小的视图
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{

    return imageV;
}


@end

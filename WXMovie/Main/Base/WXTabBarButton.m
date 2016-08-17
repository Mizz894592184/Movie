//
//  WXTabBarButton.m
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "WXTabBarButton.h"

@implementation WXTabBarButton
-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString*)imageName withTitle:(NSString*)title{
    
    self = [super initWithFrame:frame];
    
    if (self!=nil) {
        
//        1 imageView
        UIImageView *_imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-20)/2, 3, 20, 20)];
        _imageView.image = [UIImage imageNamed:imageName];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;//图片的填充类型
        [self addSubview:_imageView];
        
//        2 label
        UILabel *_titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 3+20+5, frame.size.width, 21)];
        _titleLabel.text = title;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_titleLabel];
        
        
        
        
        
        
        
        
        
    }
    return self;


}

@end

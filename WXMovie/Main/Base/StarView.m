//
//  StarView.m
//  WXMovie
//
//  Created by bing on 16/7/19.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "StarView.h"
#import "UIViewExt.h"
@implementation StarView


// 1 创建视图
//-(instancetype)initWithFrame:(CGRect)frame{ //init方法创建时
//
//    
//}
-(void)awakeFromNib{ //xib创建视图时
    
    
    [self _createSubviews];
    
    


}

-(void)_createSubviews{
    
    //黄色 灰色图片
    UIImage *yellowImage = [UIImage imageNamed:@"yellow"];
    UIImage *grayImage = [UIImage imageNamed:@"gray"];
    
    
    //1 灰色视图
    UIView *grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, yellowImage.size.width*5, yellowImage.size.height)];
    grayView.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    [self addSubview:grayView];
    
    
    //2 黄色视图
    yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, yellowImage.size.width*5, yellowImage.size.height)];
    yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    [self addSubview:yellowView];
    
    
    //放大比例
    float scale = self.frame.size.height/yellowImage.size.height;
    grayView.transform = CGAffineTransformMakeScale(scale, scale);
    yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //原始坐标归零
    
//    CGRect frame = self.frame;
//    frame.origin = CGPointZero;
//    
//    yellowView.frame = frame;
//    grayView.frame = frame;
    
    //
    yellowView.origin = CGPointZero;
    grayView.origin = CGPointZero;
    
    
    
    
    
    

}


//2 值得改变
-(void)setRating:(float)rating{

    _rating = rating;
    
    float s =rating/10;
    
    
    
    
//    CGRect frame =yellowView.frame;
//    
//    frame.size.width =self.frame.size.width*s;
//    
//    yellowView.frame = frame;
    
    
    yellowView.width = self.width*s;
    
   
    

    
}


@end

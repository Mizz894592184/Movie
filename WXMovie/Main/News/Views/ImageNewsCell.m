//
//  ImageNewsCell.m
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "ImageNewsCell.h"
#import "Common.h"
@implementation ImageNewsCell

-(void)awakeFromNib{

    
    self.imageView.contentMode = UIViewContentModeScaleToFill;
//    view
//    1 图层
//    2 事件
    
    //渲染引擎
    //layer:图层  设置 圆角 边框...
    self.imageView.layer.borderWidth = 2;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.imageView.layer.cornerRadius = 20;
    
    //裁剪多余的部分
    self.imageView.layer.masksToBounds = YES;
    
//    self.imageView.clipsToBounds = YES;
    
    
}

-(void)setModel:(ImageModel *)model{

    _model = model;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    
}

@end

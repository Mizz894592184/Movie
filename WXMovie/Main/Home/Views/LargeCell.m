//
//  LargeCell.m
//  WXMovie
//
//  Created by bing on 16/7/20.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "LargeCell.h"
#import "UIViewExt.h"
#import "MovieModel.h"
#import "Common.h"
#import "MovieDetailView.h"
@implementation LargeCell

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        //创建
        [self _createSubviews];
    }
    
    return self;
}

-(void)_createSubviews{
    
    
    //创建了海报的正面视图
    CGRect frame = CGRectMake(0, 0, self.width*0.9, self.height*0.9);
    imageV = [[UIImageView alloc]initWithFrame:frame];
    
    imageV.center = self.contentView.center;
    [self.contentView addSubview:imageV];
    
    //创建海报的反面视图
     detailView = [[[NSBundle mainBundle]loadNibNamed:@"MovieDetailView" owner:self options:nil]lastObject];
    detailView.bounds = imageV.bounds;
    
    detailView.center = imageV.center;
    
    detailView.hidden = YES;
    
    [self.contentView addSubview:detailView];
    
}


-(void)setModel:(MovieModel *)model{

    _model = model;
    
    
    NSString *urlStr = [model.images objectForKey:@"large"];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
   
    [imageV sd_setImageWithURL:url];
    
    [self.contentView addSubview:imageV];
    
    
    detailView.model =model;
    
        
}
-(void)restoreCell{

    imageV.hidden = NO;
    detailView.hidden = YES;
    
}

//翻转视图
-(void)flipCell{
    UIViewAnimationOptions options;
    
    if (detailView.hidden) {
        
        options =UIViewAnimationOptionTransitionFlipFromLeft;
    }else{
    
        options =UIViewAnimationOptionTransitionFlipFromRight;
    }
    
    
    
    [UIView transitionWithView:self duration:0.35 options:options animations:^{
        
        imageV.hidden = !imageV.hidden;
        
        detailView.hidden = !detailView.hidden;
    } completion:NULL];
    
   
    
}

@end

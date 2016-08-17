//
//  MovieDetailView.m
//  WXMovie
//
//  Created by bing on 16/7/26.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "MovieDetailView.h"
#import "Common.h"
@implementation MovieDetailView

-(void)setModel:(MovieModel *)model{

    _model = model;
    
    //图片
    NSString *imageStr = [model.images objectForKey:@"medium"];
    [movieIamgeView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    
    titleLabel.text = model.title;
    
    collect_countLabel.text = [NSString stringWithFormat:@"%lu人收藏",model.collect_count];
    
    yearLabel.text = [NSString stringWithFormat:@"年份:%@", model.year];
    float rating = [[model.rating objectForKey:@"average"]floatValue];
    ratingLabel.text = [NSString stringWithFormat:@"%.1f",rating];
    starView.rating = rating;
    
    
}

@end

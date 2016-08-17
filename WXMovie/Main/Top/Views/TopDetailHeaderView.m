//
//  TopDetailHeaderView.m
//  WXMovie
//
//  Created by bing on 16/7/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "TopDetailHeaderView.h"
#import "Common.h"

@implementation TopDetailHeaderView

-(void)setModel:(TopDetailModel *)model{

    _model = model;
    
    [movieImageV sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    
    titlelabel.text = model.titleCn;
    
    directorLabel.text = [NSString stringWithFormat:@"导演：%@",model.directors[0]];
    
    
    NSString *arrayString = [model.actors componentsJoinedByString:@"、"];
    actor.text = [NSString stringWithFormat:@"演员： %@",arrayString];
    
    //类型
    NSString *typeString = [model.type componentsJoinedByString:@"、"];
    castLabel.text = [NSString stringWithFormat:@"类型：%@",typeString];
    
    //year
    NSDictionary *release = model.TopDetailModelRelease;
    
    NSString *location = [release objectForKey:@"location"];
    
    NSString *years = [release objectForKey:@"date"];
    
    yearLabel.text = [NSString stringWithFormat:@"%@ %@",location,years];
    
    
    
    
    for (int i =0; i<4; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *imageName = model.images[i];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageName]]];
        
        [button setImage:image forState:UIControlStateNormal];
        
        button.tag = i+1000;
        
        [button addTarget:self action:@selector(imageButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(MovieView.width/4*i, 0, MovieView.width/4, 65);
        
        [MovieView addSubview:button];
    }
    
    
    
    
    
}



-(void)imageButtonAction:(UIButton*)button{
    
    
    int index =(int) button.tag-1000;
    
    NSDictionary *dic = _model.videos[index];
    
    NSString *url = [dic objectForKey:@"url"];
    
    NSLog(@"该视频连接 %@",url);
    
}

@end

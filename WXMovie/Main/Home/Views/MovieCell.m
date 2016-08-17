//
//  MovieCell.m
//  WXMovie
//
//  Created by bing on 16/7/19.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "MovieCell.h"
#import "MovieModel.h"
#import "UIImageView+WebCache.h"
@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
}

-(void)setModel:(MovieModel *)model{
    
    _model = model;
    
    //标题
    titleLabel.text = model.title;
    //年份
    yearLabel.text = [NSString stringWithFormat:@"上映年份:%@",model.year];
    //评分
    gradeLabel.text = [NSString stringWithFormat:@"评分:%@",[model.rating objectForKey:@"average"]];
    
    //图片
    //1 链接的字符串
    NSString *imageName = [model.images objectForKey:@"small"];
    //2 url地址
    NSURL *url = [NSURL URLWithString:imageName];
    //3 需要使用SDwebImage第三方框架.
    [posterView sd_setImageWithURL:url];
    
    //4 星星
    starView.rating = [[model.rating objectForKey:@"average"] floatValue];
    
    
    

    
    


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

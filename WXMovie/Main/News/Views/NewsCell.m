//
//  NewsCell.m
//  WXMovie
//
//  Created by bing on 16/7/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "NewsCell.h"
#import "Common.h"
#import "NewsDetailViewController.h"
@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(NewsModel *)model{

    _model = model;
    
    [ImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    titleLabel.text = model.title;
    SummanyLabel.text = model.summary;
    
    int typeNumber = [model.type intValue];
    
    
    if (typeNumber == 0) {
        
        [typeImageV setImage:nil];
        
        
        
    }else if (typeNumber == 1){
        
        [typeImageV setImage:[UIImage imageNamed:@"sctpxw@2x"]];
    }else if (typeNumber == 2){
        
        [typeImageV setImage:[UIImage imageNamed:@"scspxw@2x"]];
    }
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

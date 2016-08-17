//
//  CommentCell.m
//  WXMovie
//
//  Created by bing on 16/7/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "CommentCell.h"
#import "UIImageView+WebCache.h"

@implementation CommentCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(CommnetModel *)model{

    _model = model; 
    
    [userImageV sd_setImageWithURL:[NSURL URLWithString:model.userImage]];
    contentLabel.text=model.content;
    ratingLbel.text = model.rating;
    nickLabel.text = model.nickname;
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

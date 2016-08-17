//
//  SmallCell.m
//  WXMovie
//
//  Created by bing on 16/7/26.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "SmallCell.h"
#import "Common.h"
@implementation SmallCell

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        iamgeV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width*0.9, self.height*0.9)];
        iamgeV.center = self.contentView.center;
        
        [self.contentView addSubview:iamgeV];
        
        
    }
    return self;
}

-(void)setModel:(MovieModel *)model{

    _model = model;
    
    NSString *url = [model.images objectForKey:@"small"];
    [iamgeV sd_setImageWithURL:[NSURL URLWithString:url]];
    
}

@end

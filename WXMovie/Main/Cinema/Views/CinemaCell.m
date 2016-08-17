//
//  CinemaCell.m
//  WXMovie
//
//  Created by bing on 16/7/29.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "CinemaCell.h"
#import "Common.h"
@implementation CinemaCell

//创建对象
- (void)awakeFromNib {
    
}

//给对象赋值
-(void)setModel:(CinemaModel *)model{

    _model = model;
    
    //影院的名字
    cinemaName.text = _model.name;
    
    //影院评分
    ratingLabel.text = _model.grade;
    ratingLabel.left = ratingLabel.right + 5;
    
    //地址
    cinemaAddress.text = _model.address;
    
    //票价
//    priceLabel.text = _model.lowPrice;
    priceLabel.text = [NSString stringWithFormat:@"￥%@",_model.lowPrice];
    if ([_model.lowPrice isKindOfClass:[NSNull class]]) {
        
        priceLabel.text =@"";
    }

    //是否支持选座
    if ([_model.isSeatSupport integerValue] == 1) {
        
        z_image.hidden = NO;
    }else{
        
        z_image.hidden = YES;
        
    }
    
    //是否支持团购
    if ([_model.isGroupBuySupport integerValue] == 1) {
        
        t_image.hidden = NO;
    }else{
        
        t_image.hidden = YES;
        
    }
    
    //是否支持优惠券
    if ([_model.isCouponSupport integerValue] == 1) {
        
        q_image.hidden = NO;
    }else{
        
        q_image.hidden = YES;
        
    }
    
    //是否支持IMAX
    if ([_model.isImaxSupport integerValue] == 1) {
        
        iMax_image.hidden = NO;
    }else{
        
        iMax_image.hidden = YES;
        
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  PhotoCell.m
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "PhotoCell.h"
#import "Common.h"
#import "PhotoScrollView.h"

@implementation PhotoCell
-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        scrollView = [[PhotoScrollView alloc]initWithFrame:self.bounds];
        
        scrollView.tag = 1000;
//        scrollView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:scrollView];
        
    }
    return self;
    
}

-(void)setUrl:(NSString *)url{

    _url = url;
    
    scrollView.url = url;
    
    
    
  
    
}

@end

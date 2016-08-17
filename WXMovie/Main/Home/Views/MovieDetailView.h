//
//  MovieDetailView.h
//  WXMovie
//
//  Created by bing on 16/7/26.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "StarView.h"
@interface MovieDetailView : UIView
{

    IBOutlet UIImageView *movieIamgeView;
    
    IBOutlet UILabel *titleLabel;
    
    IBOutlet UILabel *collect_countLabel;
    
    IBOutlet UILabel *yearLabel;
    
    IBOutlet UILabel *ratingLabel;
    
    IBOutlet StarView *starView;
 
}

@property(nonatomic,strong)MovieModel *model;

@end

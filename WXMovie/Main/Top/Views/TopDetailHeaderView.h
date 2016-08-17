//
//  TopDetailHeaderView.h
//  WXMovie
//
//  Created by bing on 16/7/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopDetailModel.h"

@interface TopDetailHeaderView : UIView
{

    IBOutlet UIImageView *movieImageV;
    
    IBOutlet UILabel *titlelabel;
    IBOutlet UILabel *directorLabel;
    IBOutlet UILabel *actor;
    IBOutlet UILabel *castLabel;
    IBOutlet UILabel *yearLabel;
    
    IBOutlet UIView *MovieView;
}

@property(nonatomic,strong)TopDetailModel *model;

@end

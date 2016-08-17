//
//  CommentCell.h
//  WXMovie
//
//  Created by bing on 16/7/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommnetModel.h"
@interface CommentCell : UITableViewCell

{

    IBOutlet UIImageView *userImageV;
    IBOutlet UILabel *nickLabel;
    
    IBOutlet UILabel *ratingLbel;
    IBOutlet UILabel *contentLabel;
}
@property(nonatomic,strong)CommnetModel *model;

@end

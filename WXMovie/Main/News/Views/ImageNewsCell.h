//
//  ImageNewsCell.h
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModel.h"

@interface ImageNewsCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic,strong)ImageModel *model;

@end

//
//  PhotoCell.h
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScrollView.h"
@interface PhotoCell : UICollectionViewCell
{

    PhotoScrollView *scrollView;
}
@property(nonatomic,strong)NSString *url;

@end

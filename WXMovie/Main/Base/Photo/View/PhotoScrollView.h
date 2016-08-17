//
//  PhotoScrollView.h
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{

    UIImageView *imageV;
}
@property(nonatomic,copy)NSString *url;//传递的数据
@end

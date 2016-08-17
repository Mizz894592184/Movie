//
//  WXTabBarButton.h
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXTabBarButton : UIControl
/*
id和instancetype的异同
1 相同点
 都可以作为方法的返回类型
2 不同点
 instancetype可以返回和方法所在类相同类型的对象;id只能返回未知类型的对象.

*/
-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString*)imageName withTitle:(NSString*)title;


@end

//
//  ImageModel.h
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "BaseModel.h"

@interface ImageModel : BaseModel
/*
 {
 "id": 2238622,
 "image": "http://img31.mtime.cn/pi/2013/03/08/144644.81111130_1280X720.jpg",
 "type": 6
 }
 */
@property(nonatomic,copy)NSNumber *ImageModelId;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSNumber *type;

@end

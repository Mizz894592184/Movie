//
//  CinemaModel.h
//  WXMovie
//
//  Created by bing on 16/7/27.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "BaseModel.h"

@interface CinemaModel : BaseModel
/*
 {
 "lowPrice" : "40.00",
 "grade" : "8.8",
 "coord" : "116.36047,40.01433",
 "distance" : null,
 "address" : "北京市海淀区学清路甲8号，圣熙8号购物中心五层西侧。",
 "name" : "嘉华国际影城",
 "id" : "1396",
 "msg" : null,
 "districtId" : "1015",
 "tel" : "010-82732228",
 "isSeatSupport" : "1",
 "isCouponSupport" : "1",
 "isImaxSupport" : "0",
 "isGroupBuySupport" : "0",
 "circleName" : "五道口"
 }
 */

@property(nonatomic,copy)NSString *lowPrice;//区域id
@property(nonatomic,copy)NSString *grade;//区域id
@property(nonatomic,copy)NSString *coord;//区域id
@property(nonatomic,copy)NSString *distance;//区域id
@property(nonatomic,copy)NSString *address;//区域id
@property(nonatomic,copy)NSString *name;//区域id
@property(nonatomic,copy)NSString *CinemaModelId;//区域id
@property(nonatomic,copy)NSString *msg;//区域id
@property(nonatomic,copy)NSString *districtId;//区域id
@property(nonatomic,copy)NSString *tel;//区域id
@property(nonatomic,copy)NSString *isSeatSupport;//区域id
@property(nonatomic,copy)NSString *isCouponSupport;//区域id
@property(nonatomic,copy)NSString *isImaxSupport;//区域id
@property(nonatomic,copy)NSString *isGroupBuySupport;//区域id
@property(nonatomic,copy)NSString *circleName;//区域id

@end

//
//  BaseModel.m
//  WXMovie
//
//  Created by bing on 16/7/22.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

/*
 转换方法: allKeys ---->title ----->setTitle(字符串)---->setTilte(方法)
 
  model.title = [dic objectForKey:@"title"];
 model.TopModelId = [dic objectForKey:@"id"];
[ model setTitle: value ];
 
 1 找到映射字典
 //找到key属性的对应关系,json数据中的key和model类的属性名形成一个映射的关系
 key        value
 
 title     title
 year      year
 id        topModelId
 
 
 2 获取到子类的属性名字,找到set方法
 setTitle:    setYear:   setTopModelId:
 
 
 3 赋值 ()
 [model setTilte:@"肖申克的救赎"]
 
 
 */

-(NSMutableDictionary*)_buildRalationShip:(NSDictionary*)dic{
//dic:{rating:12,title:"肖申克的救赎",year:2012,id:10086}
    
    
    //allkeys:[rating,title,year,id]
    NSArray *allkeys = [dic allKeys];
    
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
    
    for (NSString *key in allkeys) {
        
        if ([key isEqualToString:@"id"]) {
            //id  --->TopModelId
            
            //获取该类的字符串
            NSString *className = NSStringFromClass([self class]);
            NSString *newString = [NSString stringWithFormat:@"%@Id",className];
            [mutableDic setObject:newString forKey:@"id"];
            
            
            
        }else if ([key isEqualToString:@"release"]){
        
            //获取该类的字符串
            NSString *className = NSStringFromClass([self class]);
            NSString *newString = [NSString stringWithFormat:@"%@Release",className];
            [mutableDic setObject:newString forKey:@"release"];
        }
        
        else{
            
             [mutableDic setObject:key forKey:key];
        }
        
       
        
    }
    
    //mutableDic:{rating:rating,title:title,year:year,id:id}
    return mutableDic;
    

}


//rating----->setRating:
-(SEL)_findSetterMethod:(NSString*)name{
    
    //1 取首字母  R
    NSString *firstLetter = [[name substringToIndex:1] uppercaseString];
    
    //2 截取剩下的字母  ating
    
    NSString *lastLetter = [name substringFromIndex:1];
    
    //3 拼接 setRating:
    NSString *settername = [NSString stringWithFormat:@"set%@%@:",firstLetter,lastLetter];
    
    //4 SEL
    //从一个方法生产字符串
//    NSStringFromClass(<#Class  _Nonnull __unsafe_unretained aClass#>)
    //从一个字符串生产方法
    SEL setter = NSSelectorFromString(settername);
    
    return setter;
    
    
}

-(void)setValueForAttributesWithDictionary:(NSDictionary*)keyedValues{

    //1 获取到映射字典
     //relationDic:{rating:rating,title:title,year:year,id:BaseModelId}
   NSMutableDictionary *relationDic =  [self _buildRalationShip:keyedValues];
    
    //2 找到set方法
    NSArray *allkeys = [relationDic allKeys];
    
    for (NSString *key in allkeys) {
        
        //如propertyName:rating  BaseModelId
        NSString *propertyName = [relationDic objectForKey:key];
        
        //如 setRating:     setBaseModelId:
        SEL method = [self _findSetterMethod:propertyName];
        
        
        //3赋值
        //如 @"肖申克的救赎"  @"10086"
        id value = [keyedValues objectForKey:key];
        
        //[model setRating:"10"]
        
        //respondsToSelector:判断该方法是否能实现
        //能实现的只有model写过属性的.
        if ([self respondsToSelector:method]) {
            
            [self performSelector:method withObject:value];
        }
      
        
        
    }
    
    
    




}
@end

//
//  NSArray+DictionaryArray.h
//  WXMovie
//
//  Created by mac on 16/8/13.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DictionaryArray)
-(NSMutableArray *)dictionaryArray:(NSArray *)array key:(NSString *)key;
@end

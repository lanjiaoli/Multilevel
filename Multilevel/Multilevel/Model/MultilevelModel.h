//
//  MultilevelModel.h
//  Multilevel
//
//  Created by L on 2018/6/29.
//  Copyright © 2018年 L. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MultilevelModel : NSObject
@property (nonatomic, copy) NSString *name;//名称
@property (nonatomic, assign) NSInteger level;//层级
@property (nonatomic, assign) BOOL isShow;//判断当前是否展开

@end

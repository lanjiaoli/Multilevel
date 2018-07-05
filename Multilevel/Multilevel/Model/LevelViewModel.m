//
//  LevelViewModel.m
//  Multilevel
//
//  Created by L on 2018/6/29.
//  Copyright © 2018年 L. All rights reserved.
//

#import "LevelViewModel.h"

@implementation LevelViewModel
#pragma mark - lazy Loading
-(NSMutableArray *)modelArray{
    if (!_modelArray) {
        _modelArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _modelArray;
}
@end

//
//  AlgorithmMoreModel.m
//  Algorithm
//
//  Created by Neroscofee on 2019/11/26.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "AlgorithmMoreModel.h"

@implementation AlgorithmMoreModel

@end

@implementation AlgorithmMoreManager

- (NSMutableArray *)moreItemModels {
    if (!_moreItemModels) {
        _moreItemModels = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"AlgorithmMore" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dic in array) {
            AlgorithmMoreModel *model = [[AlgorithmMoreModel alloc] init];
            model.algorithmName = dic[@"algorithmName"];
            model.author = dic[@"author"];
            [_moreItemModels addObject:model];
        }
    }
    return _moreItemModels;
}

@end

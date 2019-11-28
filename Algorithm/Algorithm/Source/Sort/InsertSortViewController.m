//
//  InsertSortViewController.m
//  Algorithm
//
//  Created by pushui on 2019/11/28.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "InsertSortViewController.h"

@interface InsertSortViewController ()

@end

@implementation InsertSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@89,@2,@22,@95,@88,@67,@1,@66,@43,@31,@57, nil];
    [self insertionAscendingOrderSort:arr];
}

- (void)insertionAscendingOrderSort:(NSMutableArray *)ascendingArr{
    for (NSInteger i = 1; i < ascendingArr.count; i ++) {
        NSInteger temp = [ascendingArr[i] integerValue];
        for (NSInteger j = i - 1; j >= 0 && temp < [ascendingArr[j] integerValue]; j --) {
            ascendingArr[j + 1] = ascendingArr[j];
            ascendingArr[j] = [NSNumber numberWithInteger:temp];
        }
    }
    NSLog(@"%@",ascendingArr);
}
/**
 @89,@2,@22,@95,@88,@66,@43,@31,@57
 平均时间复杂度：O(n^2)
 平均空间复杂度：O(1)
 */

@end

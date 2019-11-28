//
//  SelectionSortNewViewController.m
//  Algorithm
//
//  Created by pushui on 2019/11/28.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "SelectionSortNewViewController.h"

@interface SelectionSortNewViewController ()

@end

@implementation SelectionSortNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self sortingForSelect];
}

-(void)sortingForSelect{
    NSMutableArray *ascendingArr = [NSMutableArray arrayWithObjects:@89,@2,@22,@95,@88,@66,@43,@31,@57, nil];
    for (int i = 0; i < ascendingArr.count; i ++) {
        for (int j = i + 1; j < ascendingArr.count; j ++) {
            if ([ascendingArr[i] integerValue] > [ascendingArr[j] integerValue]) {
                int temp = [ascendingArr[i] intValue];
                ascendingArr[i] = ascendingArr[j];
                ascendingArr[j] = [NSNumber numberWithInt:temp];
            }
        }
    }
    NSLog(@"%@",ascendingArr);
}
/**
 选择排序
 平均时间复杂度：O(n^2)
 平均空间复杂度：O(1)
 */

@end

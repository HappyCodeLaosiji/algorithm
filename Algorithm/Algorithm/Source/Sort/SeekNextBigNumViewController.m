//
//  SeekNextBigNumViewController.m
//  Algorithm
//
//  Created by Neroscofee on 2019/11/26.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "SeekNextBigNumViewController.h"

@interface SeekNextBigNumViewController ()

@end

@implementation SeekNextBigNumViewController

/**
 任意输入一个数,找寻其所有位数组合起来下一个最大的数.
 比如输入123 123由 1 2 3组合而成
 它可构成的组合有 123 132 213 231 312 321
 比123组合大的最近的一个数就是132
 
 例 79310
 我自己写的看着太繁琐了,求大佬思路
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self bianli:79310];
    NSLog(@"输入的数是79310,下一个组合的最大数是%d",[self bianli:79310]);
    // Do any additional setup after loading the view.
}

- (int)bianli:(int)num {
    NSString *str = [NSString stringWithFormat:@"%d",num];
    NSString *temp = @"";
    NSMutableArray *rightPart = [NSMutableArray array];
    NSMutableArray *leftPart = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    static int t = 0;
    static int k = 0;
    bool sepatate = NO;//9243
    for (int i = (int)(str.length-1); i >= 0; i--) {
        char c = [str characterAtIndex:i];
        temp = [NSString stringWithFormat:@"%c",c];
        if ([temp intValue] >= t && !sepatate) {
            t = [temp intValue];
            [rightPart addObject:temp];
        } else {
            [leftPart addObject:temp];
            sepatate = YES;
        }
    }
    tempArr = [NSMutableArray arrayWithArray:leftPart];
    [leftPart removeAllObjects];
    for (int i = (int)(tempArr.count-1); i >= 0; i--) {
        [leftPart addObject:[tempArr objectAtIndex:i]];
    }
    k = [[leftPart objectAtIndex:leftPart.count-1] intValue];
    [leftPart removeObjectAtIndex:leftPart.count-1];
    [rightPart sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 intValue] > [obj2 intValue];
    }];
    for (int i = 0; i < rightPart.count; i++) {
        t =  [[rightPart objectAtIndex:i] intValue];
        if (t > k) {// t = 9 k = 2
            [leftPart addObject:[NSString stringWithFormat:@"%d",t]];//93
            [rightPart removeObjectAtIndex:i];//34 0139
            [rightPart addObject:[NSString stringWithFormat:@"%d",k]];//42
            break;
        }
    }
    [rightPart sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 intValue] > [obj2 intValue];
    }];
    NSString *newStr = @"";
    for (int i = 0; i < leftPart.count; i++) {
        newStr = [newStr stringByAppendingString:[NSString stringWithFormat:@"%@",[leftPart objectAtIndex:i]]];
    }
    for (int i = 0; i < rightPart.count; i++) {
        newStr = [newStr stringByAppendingString:[NSString stringWithFormat:@"%@",[rightPart objectAtIndex:i]]];
    }
    num = [newStr intValue];
    t = 0;
    k = 0;
    return num;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  SimpleCutViewController.m
//  Algorithm
//
//  Created by Neroscofee on 2019/11/28.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "SimpleCutViewController.h"

@interface SimpleCutViewController ()

@end

@implementation SimpleCutViewController

/**
 任意输入一个数,将其拆分到不能拆分为止.
 比如输入2345
 连续拆分 2+3+4+5 = 14
 14仍然能拆分
 即 1+4 = 5
 5无法拆分,返回5
 
 主要思路就是拆分不尽后的递归
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    [self simpleCut:2345];
    NSLog(@"输入的数字为2345,拆分到底为%ld",[self simpleCut:2345]);
}

- (NSInteger)simpleCut:(NSInteger)num {
    if (num/10 == 0) {
        return num;
    }
    NSInteger sum = 0;
    while (num>0) {//2345
        sum = sum + num%10;
        num = num/10;
    }
    if (sum/10>0) {
        sum = [self simpleCut:sum];
    }
    return sum;
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

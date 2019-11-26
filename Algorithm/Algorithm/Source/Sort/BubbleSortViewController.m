//
//  BubbleSortViewController.m
//  Algorithm
//
//  Created by pushui on 2019/11/26.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "BubbleSortViewController.h"

@interface BubbleSortViewController ()

@end

@implementation BubbleSortViewController

/*
 　　冒泡算法是一种基础的排序算法，这种算法会重复的比较数组中相邻的两个元素。如果一个元素比另一个元素大（小），那么就交换这两个元素的位置。重复这一比较直至最后一个元素。这一比较会重复n-1趟，每一趟比较n-j次，j是已经排序好的元素个数。每一趟比较都能找出未排序元素中最大或者最小的那个数字。这就如同水泡从水底逐个飘到水面一样。冒泡排序是一种时间复杂度较高，效率较低的排序方法。其空间复杂度是O(n)。

 　　1, 最差时间复杂度 O(n^2)
 　　2, 平均时间复杂度 O(n^2)

 　　实现思路
 　　1，每一趟比较都比较数组中两个相邻元素的大小
 　　2，如果i元素小于i-1元素，就调换两个元素的位置
 　　3，重复n-1趟的比较
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self bubbleSortByAsc];
}

//冒泡降序排序
-(void)bubbleSortByDes{
    NSMutableArray *descendingArr = [NSMutableArray arrayWithObjects:@89,@2,@22,@95,@88,@66,@43,@31,@57, nil];
    
    for (int i = 0; i < descendingArr.count; i++) {
        for (int j = 0; j < descendingArr.count - 1 - i; j++) {
            if ([descendingArr[j] intValue] < [descendingArr[j + 1] intValue]) {
                int tmp = [descendingArr[j] intValue];
                descendingArr[j] = descendingArr[j + 1];
                descendingArr[j + 1] = [NSNumber numberWithInt:tmp];
            }
        }
    }
    NSLog(@"%@", descendingArr);
}

//冒泡升序排序
-(void)bubbleSortByAsc{
    NSMutableArray *descendingArr = [NSMutableArray arrayWithObjects:@89,@2,@22,@95,@88,@66,@43,@31,@57, nil];
    
    for (int i = 0; i < descendingArr.count; i++) {
        for (int j = 0; j < descendingArr.count - 1 - i; j++) {
            if ([descendingArr[j] intValue] > [descendingArr[j + 1] intValue]) {
                int tmp = [descendingArr[j] intValue];
                descendingArr[j] = descendingArr[j + 1];
                descendingArr[j + 1] = [NSNumber numberWithInt:tmp];
            }
        }
    }
    NSLog(@"%@", descendingArr);
}

@end

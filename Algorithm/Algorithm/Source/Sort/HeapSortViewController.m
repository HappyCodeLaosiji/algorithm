//
//  HeapSortViewController.m
//  Algorithm
//
//  Created by YNZMK on 2019/12/25.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "HeapSortViewController.h"

@interface HeapSortViewController ()

@property (nonatomic,strong) NSMutableArray *tempArray;

@end

@implementation HeapSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tempArray = [NSMutableArray arrayWithArray:@[@1,@10,@3,@14,@0,@32,@16,@15]];
    [self heapSort];
    NSLog(@"%@",_tempArray);
    // Do any additional setup after loading the view.
}

- (void)heapSort{
    int length = (int)(_tempArray.count);
    //最大length进行堆排列
    for (int i = length/2 -1; i>=0; i--) {
        [self headArrangeWithStartIndex:i endIndex:length - 1];
    }
    //把堆排列的最大值放到最后边，不断对length进行减一调用堆排列函数，直到排序完成
    for (int i = length - 1; i > 0; i--) {
        [self swapIndex1:0 index2:i];
        [self headArrangeWithStartIndex:0 endIndex:i - 1];
    }
}

- (void)headArrangeWithStartIndex:(NSInteger)start endIndex:(NSInteger)end{
    //建立父子节点
    NSInteger father = start;
    NSInteger son = father * 2 + 1;
    while (son <= end) {
        if (son + 1 <= end && ((NSNumber *)_tempArray[son]).integerValue < ((NSNumber *)_tempArray[son + 1]).integerValue) {
            //选择最大的子节点
            son++;
        }
        //如果父节点最大不处理，否则父子交互数值并且进行父子位置重新赋值
        if (((NSNumber *)_tempArray[father]).integerValue > ((NSNumber *)_tempArray[son]).integerValue) {
            return;
        }else{
            [self swapIndex1:father index2:son];
            father = son;
            son = father * 2 + 1;
        }
    }
}

- (void)swapIndex1:(NSInteger)index1 index2:(NSInteger)index2{
    NSInteger temp1 = ((NSNumber *)_tempArray[index1]).integerValue;
    NSInteger temp2 = ((NSNumber *)_tempArray[index2]).integerValue;
    _tempArray[index1] = [NSNumber numberWithInteger:temp2];
    _tempArray[index2] = [NSNumber numberWithInteger:temp1];
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

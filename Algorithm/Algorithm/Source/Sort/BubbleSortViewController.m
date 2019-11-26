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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self bubbleSort];
}
-(void)bubbleSort{
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

@end

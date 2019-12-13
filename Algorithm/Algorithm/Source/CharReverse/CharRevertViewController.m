//
//  CharRevertViewController.m
//  Algorithm
//
//  Created by pushui on 2019/12/13.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "CharRevertViewController.h"

@interface CharRevertViewController ()

@end

@implementation CharRevertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Char Reverse";
    self.view.backgroundColor = [UIColor whiteColor];
    [self charReverse];
}

/**
 字符串反转
 给定字符串 "hello,world",实现将其反转。输出结果：dlrow,olleh
 */
- (void)charReverse{
    NSString * string = @"hello,5world";
    NSLog(@"原始字符串：%@",string);
    
    NSLog(@"------------------------OC语言实现--------------------------------\n");
    
    NSMutableString * reverString = [NSMutableString stringWithString:string];
    for (NSInteger i = 0; i < (string.length + 1)/2; i++) {
        
        [reverString replaceCharactersInRange:NSMakeRange(i, 1) withString:[string substringWithRange:NSMakeRange(string.length - i - 1, 1)]];
        [reverString replaceCharactersInRange:NSMakeRange(string.length - i - 1, 1) withString:[string substringWithRange:NSMakeRange(i, 1)]];
    }
    
    NSLog(@"reverString:%@",reverString);
    
    printf("------------------------C语言实现--------------------------------\n");
#pragma mark - C语言实现
    //C
    char ch[100];
    memcpy(ch, [string cStringUsingEncoding:NSUTF8StringEncoding], [string length]);
    
    //设置两个指针，一个指向字符串开头，一个指向字符串末尾
    char * begin = ch;
    char * end = ch + strlen(ch) - 1;
    //遍历字符数组，逐步交换两个指针所指向的内容，同时移动指针到对应的下个位置，直至begin>=end
    while (begin < end) {
        char temp = *begin;
        *(begin++) = *end;
        *(end--) = temp;
    }
    printf("reverseChar[]:%s",ch);
}

@end

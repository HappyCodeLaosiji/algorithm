//
//  MainViewController.m
//  Algorithm
//
//  Created by pushui on 2019/11/26.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewCell.h"
#import "AlgorithmMoreModel.h"
#import "BubbleSortViewController.h"//冒泡排序
#import "Algorithm-Swift.h"
#import "SeekNextBigNumViewController.h"
#import "SimpleCutViewController.h"
#import "SelectionSortNewViewController.h"//选择排序
#import "InsertSortViewController.h"//插入排序
#import "CharRevertViewController.h"
#import "HeapSortViewController.h" //堆排序

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;
@end

#define ALGORITHMIDENTIFIER @"ALGORITHMIDENTIFIER"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ALGORITHM";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *pushVC = nil;
    if (indexPath.row == 0) {//冒泡排序
        pushVC = [[BubbleSortViewController alloc] init];
    }else if(indexPath.row == 1){
        pushVC = SelectionSortViewController.new;
    }else if(indexPath.row == 2){
        pushVC = [[SeekNextBigNumViewController alloc] init];
    }else if(indexPath.row == 3){
        pushVC = [[SimpleCutViewController alloc] init];
    }else if(indexPath.row == 4){//选择排序
        pushVC = [[SelectionSortNewViewController alloc] init];
    }else if(indexPath.row == 5){//插入排序
        pushVC = [[InsertSortViewController alloc]init];
    }else if(indexPath.row == 6){
        pushVC = QuickSortViewController.new;//快速排序
    }else if(indexPath.row == 7){
        pushVC = radixSortViewController.new;//基数排序
    }else if(indexPath.row == 8){
        pushVC = [[CharRevertViewController alloc] init];//字符串反转
    }else if(indexPath.row == 9){
        pushVC = [[HeapSortViewController alloc]init];//堆排序
    }
    if (indexPath.row <= self.dataArray.count - 1) {
        AlgorithmMoreModel *m = self.dataArray[indexPath.row];
        pushVC.title = m.algorithmName;
        pushVC.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:pushVC animated:YES];
    }
}

#pragma mark - tableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainViewCell class]) forIndexPath:indexPath];
    cell.model = (AlgorithmMoreModel *)[self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

#pragma mark - lazy loading
- (NSArray *)dataArray {
    if (!_dataArray) {
        AlgorithmMoreManager *algorithmMoreManager = [[AlgorithmMoreManager alloc] init];
        _dataArray = algorithmMoreManager.moreItemModels;
    }
    return _dataArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource= self;
        
        [_tableView registerClass:[MainViewCell class] forCellReuseIdentifier:NSStringFromClass([MainViewCell class])];
    }
    return _tableView;
}


@end

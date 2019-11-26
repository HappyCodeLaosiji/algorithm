//
//  MainViewController.m
//  Algorithm
//
//  Created by pushui on 2019/11/26.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "MainViewController.h"
#import "BubbleSortViewController.h"//冒泡排序

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
    
    self.dataArray = @[
                       @"Sort_冒泡排序",
                       ];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//冒泡排序
        BubbleSortViewController *bubbleSortVC = [[BubbleSortViewController alloc] init];
        [self.navigationController pushViewController:bubbleSortVC animated:YES];
        
    }else if(indexPath.row == 1){
      
    }else if(indexPath.row == 2){
        
        
    }else if(indexPath.row == 3){
        
    }else if(indexPath.row == 4){
        
    }else if(indexPath.row == 5){
        
    }else if(indexPath.row == 6){
        
    }else if(indexPath.row == 7){
        
    }else if(indexPath.row == 8){
        
    }else if(indexPath.row == 9){
        
    }
}

#pragma mark - tableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ALGORITHMIDENTIFIER forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark - lazy loading
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource= self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ALGORITHMIDENTIFIER];
    }
    return _tableView;
}

@end

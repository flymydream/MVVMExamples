//
//  ListViewController.m
//  MVVMDemo
//
//  Created by hero on 2017/9/2.
//  Copyright © 2017年 hero. All rights reserved.
//

#import "ListViewController.h"
#import "listViewModel.h"
#import "NewTableViewCell.h"
#import "HeaderModel.h"
static NSString *identifier = @"cellId";
@interface ListViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;

@end
@implementation ListViewController
-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //处理业务逻辑的viewModel
    [self createViewModel];
    self.navigationItem.title = @"MVVMDemo";
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 80;
    [self.tableView registerClass:[NewTableViewCell class] forCellReuseIdentifier:identifier];
    
    
}
#pragma mark-处理业务逻辑  请求数据
-(void)createViewModel{
    listViewModel *viewModel = [[listViewModel alloc] init];
    [viewModel setBlockWithReturnBlock:^(id returnValue) {
        _dataArray = returnValue;
        [self.tableView reloadData];
        DDLog(@"%@",_dataArray);
    } WithErrorBlock:^(id errorCode) {
        //根据错误处理
    } WithFailureBlock:^{
        //失败处理
        
    }];
    
    [viewModel getNewsList];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell refreshWithHeaderModel:self.dataArray[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    listViewModel *viewModel = [[listViewModel alloc] init];
    [viewModel detailWithHeaderModel:self.dataArray[indexPath.row] WithViewController:self];

}


@end

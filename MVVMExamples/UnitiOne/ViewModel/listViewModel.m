//
//  listViewModel.m
//  MVVMDemo
//
//  Created by hero on 2017/9/2.
//  Copyright © 2017年 hero. All rights reserved.
//

#import "listViewModel.h"
#import "WebDetailViewController.h"
@implementation listViewModel
- (void)getNewsList{

    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",WebServiceAPI,getTopHotNews_Url];
    //   请求类型（1：新闻 2：学习天地 3：素材中心）
    NSDictionary *pramaDic = @{@"id":@"0",@"pagesize":@"100",@"type":@"1"};
  
    [NetRequestWork NetRequestPOSTWithRequestURL:requestUrl WithParameter:pramaDic WithReturnValeuBlock:^(id returnValue) {
        NSLog(@"%@",returnValue);
        NSDictionary *dict = returnValue;
        
        NSMutableArray *dataArr = [[NSMutableArray alloc] initWithCapacity:0];
        
        NSArray *newsArr = dict[@"news"];
        if (newsArr.count == 0) {
            return;
        }
        for (NSDictionary *newsDic in newsArr) {
            HeaderModel *headerModel = [[HeaderModel alloc] init];
            [headerModel setValuesForKeysWithDictionary:newsDic];
            [dataArr addObject:headerModel];
        }
        self.returnBlock(dataArr);

    } WithFailureBlock:^{
        
    }];
}
- (void)detailWithHeaderModel:(HeaderModel *)headerModel
           WithViewController:(UIViewController *)superController{

    WebDetailViewController *detailController = [[WebDetailViewController alloc]init];
    detailController.detailUrl = headerModel.url;
    [superController.navigationController pushViewController:detailController animated:YES];
    
}


@end

//
//  listViewModel.h
//  MVVMDemo
//
//  Created by hero on 2017/9/2.
//  Copyright © 2017年 hero. All rights reserved.
//

#import "SuperViewModel.h"
#import "HeaderModel.h"
@interface listViewModel : SuperViewModel
/**
 获取新闻列表
 */
- (void)getNewsList;


/**
 详情页

 */
- (void)detailWithHeaderModel:(HeaderModel *)headerModel
                 WithViewController:(UIViewController *)superController;
@end

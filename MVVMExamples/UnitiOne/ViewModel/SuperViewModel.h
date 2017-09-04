//
//  SuperViewModel.h
//  MVVMDemo
//
//  Created by hero on 2017/9/2.
//  Copyright © 2017年 hero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuperViewModel : NSObject
@property (strong, nonatomic) ReturnValueBlock returnBlock;
@property (strong, nonatomic) ErrorCodeBlock errorBlock;
@property (strong, nonatomic) FailureBlock failureBlock;

//获取网络的链接状态
- (void)netWorkStateWithNetConnectBlock:(NetWorkBlock) netConnectBlock
                             WithURlStr:(NSString *) strURl;

// 传入交互的Block块
- (void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock;



@end

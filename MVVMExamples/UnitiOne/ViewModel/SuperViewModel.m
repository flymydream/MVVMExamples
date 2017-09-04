//
//  SuperViewModel.m
//  MVVMDemo
//
//  Created by hero on 2017/9/2.
//  Copyright © 2017年 hero. All rights reserved.
//

#import "SuperViewModel.h"

@implementation SuperViewModel
#pragma 获取网络可到达状态
- (void)netWorkStateWithNetConnectBlock:(NetWorkBlock)
netConnectBlock WithURlStr:(NSString *) strURl{
    BOOL netState = [NetRequestWork netWorkReachabilityWithURLString:strURl];
    netConnectBlock(netState);
}
#pragma 接收传过来的block
- (void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}


@end

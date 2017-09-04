//
//  NetRequestWork.h
//  MVVMDemo
//
//  Created by hero on 2017/9/2.
//  Copyright © 2017年 hero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetRequestWork : NSObject
#pragma 监测网络的可链接性
+(BOOL)netWorkReachabilityWithURLString:(NSString *) strUrl;

#pragma POST请求
+(void)NetRequestPOSTWithRequestURL:(NSString *) requestURLString
                      WithParameter:(NSDictionary *) parameter
               WithReturnValeuBlock:(ReturnValueBlock) block
                   WithFailureBlock:(FailureBlock) failureBlock;

#pragma GET请求
+(void)NetRequestGETWithRequestURL:(NSString *) requestURLString
                     WithParameter:(NSDictionary *) parameter
              WithReturnValeuBlock:(ReturnValueBlock) block
                  WithFailureBlock:(FailureBlock) failureBlock;
@end

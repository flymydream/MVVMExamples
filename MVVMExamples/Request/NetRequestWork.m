//
//  NetRequestWork.m
//  MVVMDemo
//
//  Created by hero on 2017/9/2.
//  Copyright © 2017年 hero. All rights reserved.
//

#import "NetRequestWork.h"

@implementation NetRequestWork
/**监测网络的可用性*/
+(BOOL)netWorkReachabilityWithURLString:(NSString *) strUrl {
    __block BOOL netState = YES;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                //不可链接
            case AFNetworkReachabilityStatusNotReachable:
                 //未知网络
            case AFNetworkReachabilityStatusUnknown:
                netState = NO;
                break;
                //wifi
            case AFNetworkReachabilityStatusReachableViaWiFi:
                //蜂窝移动数据
            case AFNetworkReachabilityStatusReachableViaWWAN:
                netState = YES;
                break;
                
            default:
                break;
        }
        NSLog(@"Reachability: %@",AFStringFromNetworkReachabilityStatus(status));
        
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    return netState;

}
/**
 GET请求方式
 
 @param requestURLString 请求的URL
 @param parameter 参数
 @param block 业务逻辑成功的block回调
 @param failureBlock 网络失败的block回调
 */
+(void)NetRequestGETWithRequestURL:(NSString *) requestURLString
                     WithParameter:(NSDictionary *) parameter
              WithReturnValeuBlock:(ReturnValueBlock) block
                  WithFailureBlock:(FailureBlock) failureBlock{
    
    [[AFHTTPSessionManager manager] GET:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock();
    }];
    
    
    
}

/**
 POST请求方式
 
 @param requestURLString 请求的URL
 @param parameter 参数
 @param block 业务逻辑成功的block回调
 @param failureBlock 网络失败的block回调
 */
+(void)NetRequestPOSTWithRequestURL:(NSString *) requestURLString
                      WithParameter:(NSDictionary *) parameter
               WithReturnValeuBlock:(ReturnValueBlock) block
                   WithFailureBlock:(FailureBlock) failureBlock{

    [[AFHTTPSessionManager manager] POST:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
         block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock();
    }];



}



@end

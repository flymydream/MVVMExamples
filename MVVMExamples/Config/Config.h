//
//  Config.h
//  MVVMDemo
//
//  Created by hero on 2017/9/2.
//  Copyright © 2017年 hero. All rights reserved.
//

#ifndef Config_h
#define Config_h

//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)();
typedef void (^NetWorkBlock)(BOOL netConnetState);
#define WebServiceAPI @"http://ckysappserver.ckc8.com/"
#define BaseImagestr_Url @"http://ckysre.ckc8.com/ckc3/Uploads/"
#define getTopHotNews_Url @"Ckapp3/News/getTopHotNews"



#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width


/* --------------------屏幕适配比例-------------------- */
//不同屏幕尺寸字体适配（320，568是因为效果图为IPHONE5系列 如果不是则根据实际情况修改）
#define kScreenWidthRatio       (SCREEN_WIDTH / 375.0)
#define kScreenHeightRatio      (SCREEN_HEIGHT / 667.0)
#define AdaptedWidth(x)         ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x)        ceilf((x) * kScreenHeightRatio)
#pragma mark - ***********************字体适配相关*****************************
// 中文字体-未使用
#define CHINESE_FONT_NAME       @"Heiti SC"

// #define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]
#define CHINESE_SYSTEM(x)       [UIFont systemFontOfSize:x]
#define CHINESE_SYSTEM_BOLD(x)  [UIFont boldSystemFontOfSize:x]

// 字体定义
#define NAV_BAR_FONT            CHINESE_SYSTEM(AdaptedWidth(18))  //导航栏文字
#define MAIN_BODYTITLE_FONT    CHINESE_SYSTEM(AdaptedWidth(17))    // 主标题 正文 文字

#define MAIN_SAVEBUTTON_FONT    CHINESE_SYSTEM(AdaptedWidth(16))    // 主标题 正文 文字
#define ALL_ALERT_FONT    CHINESE_SYSTEM(AdaptedWidth(15))    //弹窗文字

#define MAIN_BoldTITLE_FONT    CHINESE_SYSTEM_BOLD(AdaptedWidth(14)) // 主标题 名字
#define MAIN_TITLE_FONT        CHINESE_SYSTEM(AdaptedWidth(14))    // 默认文字大小
#define MAIN_NAMETITLE_FONT    CHINESE_SYSTEM(AdaptedWidth(13))    // 默认文字大小
#define MAIN_SUBTITLE_FONT     CHINESE_SYSTEM(AdaptedWidth(11))   // 辅助说明文字
/**判空处理*/
#define IsNilOrNull(_ref) (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]])  || ([(_ref) isKindOfClass:[NSNull class]]) || ([(_ref) isEqualToString:@"(null)"]) || ([(_ref) isEqualToString:@""]) || ([(_ref) isEqualToString:@"null"]) || ([(_ref) isEqualToString:@"<null>"]))

#define DDLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)



#endif /* Config_h */

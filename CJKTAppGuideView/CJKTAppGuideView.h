//
//  CJKTGuideView.h
//  CJKTGuideView
//
//  Created by Dxc_iOS on 2018/9/28.
//  Copyright © 2018年 超级课堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BOOLFORKEY @"FirstGuidePage"
#define kSCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define kSCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface CJKTAppGuideView : UIView

@property (nonatomic, copy) void (^goLoginAction)(void);
@property (nonatomic, copy) void (^goRegisterAction)(void);

/**
 图片引导页
 */
- (instancetype)initWithFrame:(CGRect)frame imageNameArray:(NSArray<NSString *> *)imageNameArray;


/**
 视频引导页
 */
- (instancetype)initWithFrame:(CGRect)frame videoURL:(NSURL *)videoURL;

@end

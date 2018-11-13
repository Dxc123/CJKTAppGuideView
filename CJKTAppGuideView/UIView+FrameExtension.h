//
//  UIView+FrameExtension.h
//  CJKTAppGuideViewExample
//
//  Created by Dxc_iOS on 2018/11/12.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FrameExtension)
/**  起点x坐标  */
@property (nonatomic, assign) CGFloat frame_x;
/**  起点y坐标  */
@property (nonatomic, assign) CGFloat  frame_y;
/**  中心点x坐标  */
@property (nonatomic, assign) CGFloat  frame_centerX;
/**  中心点y坐标  */
@property (nonatomic, assign) CGFloat  frame_centerY;
/**  宽度  */
@property (nonatomic, assign) CGFloat  frame_width;
/**  高度  */
@property (nonatomic, assign) CGFloat  frame_height;
/**  顶部  */
@property (nonatomic, assign) CGFloat  frame_top;
/**  底部  */
@property (nonatomic, assign) CGFloat  frame_bottom;
/**  左边  */
@property (nonatomic, assign) CGFloat  frame_left;
/**  右边  */
@property (nonatomic, assign) CGFloat  frame_right;
/**  size  */
@property (nonatomic, assign) CGSize  frame_size;
/**  origin */
@property (nonatomic, assign) CGPoint  frame_origin;
@end

NS_ASSUME_NONNULL_END

//
//  UIView+FrameExtension.m
//  CJKTAppGuideViewExample
//
//  Created by Dxc_iOS on 2018/11/12.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "UIView+FrameExtension.h"

@implementation UIView (FrameExtension)
- (void)setFrame_x:(CGFloat)frame_x {
    CGRect frame = self.frame;
    frame.origin.x = frame_x;
    self.frame = frame;
}

- (void)setFrame_y:(CGFloat)frame_y {
    CGRect frame = self.frame;
    frame.origin.y = frame_y;
    self.frame = frame;
}

- (CGFloat)frame_x {
    return self.frame.origin.x;
}

- (CGFloat)frame_y {
    return self.frame.origin.y;
}

- (void)setFrame_centerX:(CGFloat)frame_centerX {
    
    CGPoint center = self.center;
    center.x = frame_centerX;
    self.center = center;
    
}

- (CGFloat)frame_centerX {
    return self.center.x;
}

- (void)setFrame_centerY:(CGFloat)frame_centerY{
    CGPoint center = self.center;
    center.y = frame_centerY;
    self.center = center;
}

- (CGFloat)frame_centerY {
    return self.center.y;
}

- (void)setFrame_width:(CGFloat)frame_width{
    CGRect frame = self.frame;
    frame.size.width = frame_width;
    self.frame = frame;
}
- (CGFloat)frame_width {
    return self.frame.size.width;
}

- (void)setFrame_height:(CGFloat)frame_height {
    CGRect frame = self.frame;
    frame.size.height = frame_height;
    self.frame = frame;
}

- (CGFloat)frame_height {
    return self.frame.size.height;
}


- (void)setFrame_size:(CGSize)frame_size {
    CGRect frame = self.frame;
    frame.size = frame_size;
    self.frame = frame;
}

- (CGSize)frame_size {
    return self.frame.size;
}

- (void)setFrame_origin:(CGPoint)frame_origin{
    CGRect frame = self.frame;
    frame.origin = frame_origin;
    self.frame = frame;
}

- (CGPoint)frame_origin {
    return self.frame.origin;
}


- (void)setFrame_top:(CGFloat)frame_top {
    CGRect frame = self.frame;
    frame.origin.y = frame_top;
    self.frame = frame;
}
- (CGFloat)frame_top {
    return self.frame.origin.y;
}


- (void)setFrame_left:(CGFloat)frame_left {
    CGRect frame = self.frame;
    frame.origin.x = frame_left;
    self.frame = frame;
}
- (CGFloat)frame_left {
    return self.frame.origin.x;
}



- (void)setFrame_bottom:(CGFloat)frame_bottom{
    CGRect frame = self.frame;
    frame.origin.y = frame_bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)frame_bottom {
    return self.frame.size.height + self.frame.origin.y;
}

- (void)setFrame_right:(CGFloat)frame_right {
    CGRect frame = self.frame;
    frame.origin.x = frame_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)frame_right {
    return self.frame.size.width + self.frame.origin.x;
}

@end

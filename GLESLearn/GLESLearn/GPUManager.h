//
//  GPUManager.h
//  GLESLearn
//
//  Created by weixu on 2017/11/28.
//  Copyright © 2017年 weixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GPUManager : NSObject
- (void)attachViewToContext:(UIView*) view;
- (void)resetSize:(CGSize)size;

- (void)beginAnimation;
@end

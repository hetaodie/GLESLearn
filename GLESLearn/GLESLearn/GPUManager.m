//
//  GPUManager.m
//  GLESLearn
//
//  Created by weixu on 2017/11/28.
//  Copyright © 2017年 weixu. All rights reserved.
//


#import "GPUManager.h"
#import "EAGLKView.h"

@interface GPUManager()
@property (nonatomic, assign) BOOL animating;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) EAGLKView *eaglkView;

@end

@implementation GPUManager

#pragma mark -
#pragma mark lifecycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


#pragma mark -
#pragma mark public

- (void)attachViewToContext:(UIView*) view {
    self.eaglkView = (EAGLKView *)view;
}

- (void)resetSize:(CGSize)size {
    
}

- (void)beginAnimation {
    [self startAnimation];
}


#pragma mark -
#pragma mark notification

#pragma mark -
#pragma mark delegate


#pragma mark -
#pragma mark private

- (void)startAnimation
{
    if (!self.animating)
    {
        CADisplayLink *aDisplayLink = [[UIScreen mainScreen] displayLinkWithTarget:self selector:@selector(render)];
        [aDisplayLink setFrameInterval:1];
        [aDisplayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        self.displayLink = aDisplayLink;
        self.animating = YES;
    }
}

- (void)stopAnimation
{
    if (self.animating)
    {
        [self.displayLink invalidate];
        self.displayLink = nil;
        self.animating = NO;
    }
}

- (void)render {
    [self.eaglkView render];
}

@end

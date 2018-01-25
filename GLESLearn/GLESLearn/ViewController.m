//
//  ViewController.m
//  GLESLearn
//
//  Created by weixu on 2017/11/28.
//  Copyright © 2017年 weixu. All rights reserved.
//

#import "ViewController.h"
#import "EAGLKView.h"
#import "GPUManager.h"
#import <GLKit/GLKit.h>

@interface ViewController ()<GLKViewDelegate>
@property (weak, nonatomic) IBOutlet EAGLKView *eaglkView;
@property (nonatomic, strong) GPUManager *gpuManager;
@property (nonatomic, strong) GLKView *glkView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gpuManager = [[GPUManager alloc] init];
    [self.gpuManager attachViewToContext:self.eaglkView];
//    [self setUpGLKView];
}

- (void)setUpGLKView {
    EAGLContext * context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2]; // 1
    GLKView *view = [[GLKView alloc] initWithFrame:[[UIScreen mainScreen] bounds]]; // 2
    view.context = context; // 3
    view.delegate = self; // 4
    self.glkView = view;
    
    [self.eaglkView addSubview:view];
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(1.0, 0.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
}

- (IBAction)beginBtnPress:(id)sender {
    [self.gpuManager beginAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

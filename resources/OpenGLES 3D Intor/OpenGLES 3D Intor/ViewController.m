//
//  ViewController.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 4/26/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "ViewController.h"
#import "MyGlobal.h"

@interface ViewController ()

@end

@implementation ViewController{
    GLKView *view;
    NSTimer *timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    view = (GLKView*)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0, 104.0/255, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
}

- (void)update{
    //[self RunFunction2:@selector(ChangeRedColor) After:changeInSec];
}
@end

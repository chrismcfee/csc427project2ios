//
//  ParentGLKViewController.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 5/3/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "ParentGLKViewController.h"

@interface ParentGLKViewController ()

@end

@implementation ParentGLKViewController{
    GLKView *view;
    NSTimer *timer;
}

-(void)setupScene{
    _shader.projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(85), self.view.bounds.size.width/self.view.bounds.size.height, 1, 150);
}

-(void)setupShader{
    [self setupVertexShader:@"SimpleVertexTexture.glsl" FragmentShader:@"SimpleTextureFragment.glsl"];
}
-(void)setupVertexShader:(NSString*)vertexShader FragmentShader:(NSString*)fragmentShader{
    _shader = [[RWTBaseEffect alloc] initWithVertexShader:vertexShader fragmentShader:fragmentShader];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    view = (GLKView*)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:view.context];
    [self setupShader];
    [self setupScene];
    ViewMatrix = GLKMatrix4MakeTranslation(0, 0, -3);
    ViewMatrix = GLKMatrix4Rotate(ViewMatrix, GLKMathDegreesToRadians(20), 1, 0, 0);
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0, 104.0/255, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
}

- (void)update{
    //[self RunFunction2:@selector(ChangeRedColor) After:changeInSec];
}
@end

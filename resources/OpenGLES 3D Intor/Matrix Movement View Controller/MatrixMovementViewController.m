//
//  MatrixMovementViewController.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 4/26/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "MatrixMovementViewController.h"
#import "Square.h"

@interface MatrixMovementViewController ()

@end

@implementation MatrixMovementViewController
{
    RWTBaseEffect *_shader;
    Square *_square;
}

-(void)setupScene{
    _shader = [[RWTBaseEffect alloc] initWithVertexShader:@"SimpleModelVertexColor.glsl" fragmentShader:@"SimpleFragment.glsl"];
    _square = [[Square alloc] initWithShader:_shader];
    _square.scale = GLKVector3Make(0.5, 0.5, 1);
    _square.rotationZ = M_PI/4;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GLKView *view = (GLKView*)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    [EAGLContext setCurrentContext:view.context];
    [self setupScene];
}

- (void) glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0, 104.0/255, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    [_square render];
}

- (void) update{
    [_square updateWithDelta:self.timeSinceLastUpdate];
    _square.rotationZ += 0.1;
}
@end
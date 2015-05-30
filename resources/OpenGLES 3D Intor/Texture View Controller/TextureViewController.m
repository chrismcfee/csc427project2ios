//
//  TextureViewController.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 4/27/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "TextureViewController.h"
#import "Square.h"
#import "CubeT.h"

@interface TextureViewController ()

@end

@implementation TextureViewController
{
    RWTBaseEffect *_shader;
    CubeT *_cube;
}

-(void)setupScene{
    _shader = [[RWTBaseEffect alloc] initWithVertexShader:@"SimpleVertexTexture.glsl" fragmentShader:@"SimpleTextureFragment.glsl"];
    _cube = [[CubeT alloc] initWithShader:_shader];
    _cube.scale = GLKVector3Make(0.5, 0.5, 0.5);
    //_square.rotationZ = M_PI/4;
    _shader.projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(85), self.view.bounds.size.width/self.view.bounds.size.height, 1, 150);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GLKView *view = (GLKView*)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    view.drawableDepthFormat = GLKViewDrawableDepthFormat16;
    
    [EAGLContext setCurrentContext:view.context];
    [self setupScene];
}

- (void) glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0, 104.0/255, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    GLKMatrix4 viewMatrix = GLKMatrix4MakeTranslation(0, 0, -3);
    
    [_cube renderWithParentModelViewMatrix:viewMatrix];
    
}

- (void) update{
    [_cube updateWithDelta:self.timeSinceLastUpdate];
}
@end

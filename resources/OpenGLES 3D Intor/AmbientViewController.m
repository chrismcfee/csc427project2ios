//
//  AmbientViewController.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 5/3/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "AmbientViewController.h"
#import "CubeT.h"

@interface AmbientViewController ()

@end

@implementation AmbientViewController
{
    CubeT *_cube;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupVertexShader:@"SimpleVertexTexture.glsl" FragmentShader:@"SimpleAmbientFragment.glsl"];
    _shader.lightColor = GLKVector3Make(1, 1, 1);
    _shader.lightIntensity = 1.5;
    [self setupScene];
    
    _cube = [[CubeT alloc] initWithShader:_shader];
    _cube.scale = GLKVector3Make(0.5, 0.5, 0.5);
}

- (void)update{
    [_cube updateWithDelta:self.timeSinceLastUpdate];
}
-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [super glkView:view drawInRect:rect];
    [_cube renderWithParentModelViewMatrix:ViewMatrix];
}

@end

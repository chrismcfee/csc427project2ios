//
//  SpecularViewController.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 5/3/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "SpecularViewController.h"
#import "CubeNorm.h"

@interface SpecularViewController ()

@end

@implementation SpecularViewController
{
    CubeNorm *_cube;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupVertexShader:@"SimpleSpecularVertex.glsl" FragmentShader:@"SimpleSpecularFragment.glsl"];
    _shader.lightColor = GLKVector3Make(1, 1, 1);
    _shader.lightIntensity = 0.1;
    [self setupScene];
    
    _cube = [[CubeNorm alloc] initWithShader:_shader];
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

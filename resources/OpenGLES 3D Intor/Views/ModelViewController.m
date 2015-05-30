//
//  ModelViewController.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 5/6/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "ModelViewController.h"
#import "MyMushroomObj.h"

@interface ModelViewController ()

@end

@implementation ModelViewController
{
    MyMushroomObj *_cube;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupVertexShader:@"SimpleSpecularVertex.glsl" FragmentShader:@"SimpleSpecularFragment.glsl"];
    _shader.lightColor = GLKVector3Make(1, 1, 1);
    _shader.lightIntensity = 0.1;
    [self setupScene];
    
    _cube = [[MyMushroomObj alloc] initWithShader:_shader];
    _cube.scale = GLKVector3Make(0.3, 0.3, 0.3);
}

- (void)update{
    [_cube updateWithDelta:self.timeSinceLastUpdate];
}
-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [super glkView:view drawInRect:rect];
    [_cube renderWithParentModelViewMatrix:ViewMatrix];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    CGPoint xLocation = CGPointMake(location.x, location.y);
    //Image.center = xLocation;
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    CGPoint xLocation = CGPointMake(location.x, location.y);
    //Image.center = xLocation;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

@end

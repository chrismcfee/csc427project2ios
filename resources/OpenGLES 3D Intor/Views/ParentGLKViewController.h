//
//  ParentGLKViewController.h
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 5/3/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "RWTBaseEffect.h"

@interface ParentGLKViewController : GLKViewController
{
    RWTBaseEffect *_shader;
    GLKMatrix4 ViewMatrix;
}

-(void)setupScene;
-(void)setupShader;
-(void)setupVertexShader:(NSString*)vertexShader FragmentShader:(NSString*)fragmentShader;

@end

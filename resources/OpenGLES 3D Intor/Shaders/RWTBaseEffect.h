//
//  RWTBaseEffect.h
//  HelloOpenGL
//
//  Created by Ray Wenderlich on 9/3/13.
//  Copyright (c) 2013 Ray Wenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/glext.h>
#import "Vertex.h"

@import GLKit;

@interface RWTBaseEffect : NSObject

@property (nonatomic, assign) GLuint programHandle;
@property (nonatomic, assign) GLKMatrix4 modelViewMatrix;
@property (nonatomic, assign) GLKMatrix4 projectionMatrix;
//Ambient
@property (nonatomic, assign) GLKVector3 lightColor;
@property (nonatomic, assign) float lightIntensity;
//Diffuse
@property (nonatomic, assign) GLKVector3 lightDirection;
@property (nonatomic, assign) float lightDiffuseIntensity;
//Specular
@property (nonatomic, assign) float MatSpecularIntensity;
@property (nonatomic, assign) float Shininess;

@property (assign) GLuint texture;

- (id)initWithVertexShader:(NSString *)vertexShader
            fragmentShader:(NSString *)fragmentShader;
- (void)prepareToDraw;

@end

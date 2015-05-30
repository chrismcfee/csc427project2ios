//
//  MyModel.h
//  HelloOpenGLES
//
//  Created by Elhassan Ahmed on 4/25/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "RWTBaseEffect.h"
#import "Vertex.h"

@import GLKit;

@class RWTBaseEffect;

@interface MyModel : NSObject
@property(nonatomic,strong) RWTBaseEffect *shader;
@property(nonatomic,assign) GLKVector3 Position;
@property(nonatomic) float rotationX;
@property(nonatomic) float rotationY;
@property(nonatomic) float rotationZ;
@property(nonatomic) GLKVector3 scale;
@property(nonatomic) GLuint texture;

-(instancetype)initWithName:(char*)name shader:(RWTBaseEffect*)shader vertices:(VertexColor*)vertices vertexCount:(unsigned int)vertexCount indices:(GLubyte*) indices indexCount:(unsigned int)indexCount;
-(instancetype)initWithName:(char*)name shader:(RWTBaseEffect*)shader vertices:(VertexColor*)vertices vertexCount:(unsigned int)vertexCount;
-(instancetype)initWithModel:(char*)name shader:(RWTBaseEffect*)shader vertices:(VertexTextureNorm*)vertices vertexCount:(unsigned int)vertexCount;
-(instancetype)initWithName:(char*)name shader:(RWTBaseEffect*)shader verticesTexture:(VertexTexture*)vertices vertexCount:(unsigned int)vertexCount indices:(GLubyte*) indices indexCount:(unsigned int)indexCount;
-(instancetype)initWithName:(char*)name shader:(RWTBaseEffect*)shader verticesTextureNorm:(VertexTextureNorm*)vertices vertexCount:(unsigned int)vertexCount indices:(GLubyte*) indices indexCount:(unsigned int)indexCount;
-(void)render;
-(void)renderWithParentModelViewMatrix:(GLKMatrix4)parentModelViewMatrix;
-(void)updateWithDelta:(NSTimeInterval)dt;
-(void)loadTexture:(NSString*)filename;

@end

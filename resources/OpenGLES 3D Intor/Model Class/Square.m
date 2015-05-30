//
//  Square.m
//  HelloOpenGLES
//
//  Created by Elhassan Ahmed on 4/25/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "Square.h"
//face
const static VertexColor vertices[] = {
    {{0.5,0.5,0},{1,0,0,1}},//A
    {{-0.5,0.5,0},{0,1,0,1}}, //B
    {{0.5,-0.5,0},{0,0,1,1}}, //C
    {{-0.5,-0.5,0},{1,1,0,1}}, //C
};
@implementation Square

-(instancetype)initWithShader:(RWTBaseEffect*)shader{
    int VerticesSize = (sizeof vertices) / (sizeof vertices[0]);
    const int indicesSize =(VerticesSize-3)*3+3;
    GLubyte indices[indicesSize];
    indices[0] = 0;
    indices[1] = 1;
    indices[2] = 2;
    for (int i = 3; i < indicesSize; i+=3) {
        indices[i] = indices[i-2];
        indices[i+1] = indices[i-1];
        indices[i+2] = indices[i-1]+1;
    }
    if((self = [super initWithName:"Square" shader:shader vertices:(VertexColor*) vertices vertexCount:VerticesSize indices:indices indexCount:indicesSize]))
    {
        
    }
    return self;
}

-(instancetype)initWithShader:(RWTBaseEffect*)shader initVerticesColor:(VertexColor *)Vertices verticesSize:(int)VerticesSize{
    const int indicesSize =(VerticesSize-3)*3+3;
    GLubyte indices[indicesSize];
    indices[0] = 0;
    indices[1] = 1;
    indices[2] = 2;
    for (int i = 3; i < indicesSize; i+=3) {
        indices[i] = indices[i-2];
        indices[i+1] = indices[i-1];
        indices[i+2] = indices[i-1]+1;
    }
    if((self = [super initWithName:"Square" shader:shader vertices:(VertexColor*) Vertices vertexCount:VerticesSize indices:indices indexCount:indicesSize]))
    {
        
    }
    return self;
}

-(instancetype)initWithShader:(RWTBaseEffect*)shader initVerticesColor:(VertexColor *)Vertices verticesSize:(int)VerticesSize indices:(GLubyte*)indices indicesSize:(int)indicesSize
{
    if((self = [super initWithName:"Square" shader:shader vertices:(VertexColor*) Vertices vertexCount:VerticesSize indices:indices indexCount:indicesSize]))
    {
        
    }
    return self;
}

-(void)updateWithDelta:(NSTimeInterval)dt{
    float secsPerMove = 2;
    self.Position = GLKVector3Make(sinf(CACurrentMediaTime()*2*M_PI/secsPerMove), self.Position.y, self.Position.z);
}

@end

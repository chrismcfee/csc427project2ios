//
//  Cube.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 4/26/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "Cube.h"

@implementation Cube

-(instancetype)initWithShader:(RWTBaseEffect*)shader{
    
    const VertexColor Vertices[] = {
        //front
        {{1,-1,1},{1,0,0,1}},//0
        {{1,1,1},{0,1,0,1}},//1
        {{-1,1,1},{0,0,1,1}},//2
        {{-1,-1,1},{1,1,0,1}},//3
        //back
        {{-1,-1,-1},{1,0,0,1}},//4
        {{-1,1,-1},{0,1,0,1}},//5
        {{1,1,-1},{0,0,1,1}},//6
        {{1,-1,-1},{1,1,0,1}},//7
    };
    
    const GLubyte indices[] ={
        //front
        0,1,2,
        2,3,0,
        //back
        4,5,6,
        6,7,4,
        //Left
        3,2,5,
        5,4,3,
        //Right
        7,6,1,
        1,0,7,
        //Top
        1,6,5,
        5,2,1,
        //Bottom
        3,4,7,
        7,0,3
    };
    
    if((self = [super initWithName:"cube" shader:shader vertices:(VertexColor*) Vertices vertexCount:(sizeof Vertices)/(sizeof Vertices[0]) indices:(GLubyte*)indices indexCount:sizeof(indices)/sizeof(indices[0])]))
    {
        
    }
    return self;
}
-(void)updateWithDelta:(NSTimeInterval)dt
{
    self.rotationZ += M_PI *dt;
    self.rotationY += M_PI *dt;
}
@end

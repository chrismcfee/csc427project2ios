//
//  CubeT.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 4/27/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "CubeT.h"

@implementation CubeT

-(instancetype)initWithShader:(RWTBaseEffect*)shader{
    
    const static VertexTexture Vertices[] = {
        // Front
        {{1, -1, 1}, {1, 0, 0, 1}, {1, 0}}, // 0
        {{1, 1, 1}, {0, 1, 0, 1}, {1, 1}}, // 1
        {{-1, 1, 1}, {0, 0, 1, 1}, {0, 1}}, // 2
        {{-1, -1, 1}, {0, 0, 0, 1}, {0, 0}}, // 3
        
        // Back
        {{-1, -1, -1}, {0, 0, 1, 1}, {1, 0}}, // 4
        {{-1, 1, -1}, {0, 1, 0, 1}, {1, 1}}, // 5
        {{1, 1, -1}, {1, 0, 0, 1}, {0, 1}}, // 6
        {{1, -1, -1}, {0, 0, 0, 1}, {0, 0}}, // 7
        
        // Left
        {{-1, -1, 1}, {1, 0, 0, 1}, {1, 0}}, // 8
        {{-1, 1, 1}, {0, 1, 0, 1}, {1, 1}}, // 9
        {{-1, 1, -1}, {0, 0, 1, 1}, {0, 1}}, // 10
        {{-1, -1, -1}, {0, 0, 0, 1}, {0, 0}}, // 11
        
        // Right
        {{1, -1, -1}, {1, 0, 0, 1}, {1, 0}}, // 12
        {{1, 1, -1}, {0, 1, 0, 1}, {1, 1}}, // 13
        {{1, 1, 1}, {0, 0, 1, 1}, {0, 1}}, // 14
        {{1, -1, 1}, {0, 0, 0, 1}, {0, 0}}, // 15
        
        // Top
        {{1, 1, 1}, {1, 1, 1, 1}, {1, 0}}, // 16
        {{1, 1, -1}, {1, 1, 1, 1}, {1, 1}}, // 17
        {{-1, 1, -1}, {1, 1, 1, 1}, {0, 1}}, // 18
        {{-1, 1, 1}, {1, 1, 1, 1}, {0, 0}}, // 19
        
        // Bottom
        {{1, -1, -1}, {1, 0, 0, 1}, {1, 0}}, // 20
        {{1, -1, 1}, {0, 1, 0, 1}, {1, 1}}, // 21
        {{-1, -1, 1}, {0, 0, 1, 1}, {0, 1}}, // 22
        {{-1, -1, -1}, {0, 0, 0, 1}, {0, 0}}, // 23
    };
    
    const GLubyte indices[] ={
        // Front
        0, 1, 2,
        2, 3, 0,
        // Back
        4, 5, 6,
        6, 7, 4,
        // Left
        8, 9, 10,
        10, 11, 8,
        // Right
        12, 13, 14,
        14, 15, 12,
        // Top
        16, 17, 18,
        18, 19, 16,
        // Bottom
        20, 21, 22,
        22, 23, 20
    };
    
    if((self = [super initWithName:"cubeTexture" shader:shader verticesTexture:(VertexTexture*) Vertices vertexCount:(sizeof Vertices)/(sizeof Vertices[0]) indices:(GLubyte*)indices indexCount:sizeof(indices)/sizeof(indices[0])]))
    {
        [self loadTexture:@"stone.jpg"];
    }
    return self;
}
-(void)updateWithDelta:(NSTimeInterval)dt
{
    //self.rotationZ += M_PI *dt/2;
    self.rotationY += M_PI *dt/8;
}
@end

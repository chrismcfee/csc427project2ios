//
//  Square.h
//  HelloOpenGLES
//
//  Created by Elhassan Ahmed on 4/25/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "MyModel.h"

@interface Square : MyModel
-(instancetype)initWithShader:(RWTBaseEffect*)shader;
-(instancetype)initWithShader:(RWTBaseEffect*)shader initVerticesColor:(VertexColor *)Vertices verticesSize:(int)VerticesSize;
-(instancetype)initWithShader:(RWTBaseEffect*)shader initVerticesColor:(VertexColor *)Vertices verticesSize:(int)VerticesSize indices:(GLubyte*)indices indicesSize:(int)indicesSize;
@end

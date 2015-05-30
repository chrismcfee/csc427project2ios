//
//  Vertex.h
//  HelloOpenGLES
//
//  Created by Elhassan Ahmed on 4/25/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#ifndef HelloOpenGLES_Vertex_h
#define HelloOpenGLES_Vertex_h
typedef enum{
    VertexAttribPosition = 0,
    VertexAttribColor,
    VertexAttribTexCoord,
    VertexAttribNormal
} VertexAttributesPosition;

typedef struct{
    GLfloat Position[3];
} Vertex;

typedef struct{
    GLfloat Position[3];
    GLfloat Color[4];
} VertexColor;

typedef struct{
    GLfloat Position[3];
    GLfloat Color[4];
    GLfloat TextureCoordinate[2];
} VertexTexture;
typedef struct {
    GLfloat Position[3];
    GLfloat Color[4];
    GLfloat TextureCoordinate[2];
    GLfloat Normal[3];
} VertexTextureNorm;

#endif

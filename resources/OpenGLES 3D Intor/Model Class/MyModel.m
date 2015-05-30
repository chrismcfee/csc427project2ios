//
//  MyModel.m
//  HelloOpenGLES
//
//  Created by Elhassan Ahmed on 4/25/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "MyModel.h"
@implementation MyModel{
    char *_name;
    GLuint _verticesArrayBuffer;
    GLuint _vertexBuffer;
    GLuint _indexBuffer;
    unsigned int _indexCount;
    unsigned int _vertexCount;
    RWTBaseEffect *_shader;
    enum PrimitiveType{
        TriangleList,TriangleStrip,Triangles
    }_primitiveType;
}

-(instancetype)initWithName:(char*)name shader:(RWTBaseEffect*)shader vertices:(VertexColor*)vertices vertexCount:(unsigned int)vertexCount indices:(GLubyte*) indices indexCount:(unsigned int)indexCount{
    if ((self = [super init])) {
        _name = name;
        _vertexCount = vertexCount;
        _indexCount = indexCount;
        _shader = shader;
        self.Position = GLKVector3Make(0, 0, 0);
        self.rotationX = 0;
        self.rotationY = 0;
        self.rotationZ = 0;
        self.scale = GLKVector3Make(1, 1, 1);
        
        //Generate and bind vertex array buffer
        glGenVertexArraysOES(1, &_verticesArrayBuffer);
        glBindVertexArrayOES(_verticesArrayBuffer);
        
        //Generate vertex buffer
        //VerticesSize = (sizeof vertices) / (sizeof vertices[0]);
        glGenBuffers(1, &_vertexBuffer);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBufferData(GL_ARRAY_BUFFER, vertexCount * sizeof(VertexColor), vertices, GL_STATIC_DRAW);//Another option GL_DYNAMIC_DRAW
        
        //Generate index buffer
        glGenBuffers(1, &_indexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, indexCount * sizeof(GLubyte), indices, GL_STATIC_DRAW);
        
        // Enable vertex attributes
        glEnableVertexAttribArray(VertexAttribPosition);
        glVertexAttribPointer(VertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(VertexColor), (const GLvoid*)offsetof(VertexColor, Position));
        glEnableVertexAttribArray(VertexAttribColor);
        glVertexAttribPointer(VertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(VertexColor), (const GLvoid*)offsetof(VertexColor, Color));
        
        glBindVertexArrayOES(0);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        
        _primitiveType = TriangleList;
    }
    return self;
}
-(instancetype)initWithName:(char*)name shader:(RWTBaseEffect*)shader vertices:(VertexColor*)vertices vertexCount:(unsigned int)vertexCount {
    if ((self = [super init])) {
        _name = name;
        _vertexCount = vertexCount;
        _shader = shader;
        self.Position = GLKVector3Make(0, 0, 0);
        self.rotationX = 0;
        self.rotationY = 0;
        self.rotationZ = 0;
        self.scale = GLKVector3Make(1, 1, 1);
        
        //Generate and bind vertex array buffer
        glGenVertexArraysOES(1, &_verticesArrayBuffer);
        glBindVertexArrayOES(_verticesArrayBuffer);
        
        //Generate vertex buffer
        //VerticesSize = (sizeof vertices) / (sizeof vertices[0]);
        glGenBuffers(1, &_vertexBuffer);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBufferData(GL_ARRAY_BUFFER, vertexCount * sizeof(VertexColor), vertices, GL_STATIC_DRAW);//Another option GL_DYNAMIC_DRAW
        
        // Enable vertex attributes
        glEnableVertexAttribArray(VertexAttribPosition);
        glVertexAttribPointer(VertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(VertexColor), (const GLvoid*)offsetof(VertexColor, Position));
        glEnableVertexAttribArray(VertexAttribColor);
        glVertexAttribPointer(VertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(VertexColor), (const GLvoid*)offsetof(VertexColor, Color));
        
        glBindVertexArrayOES(0);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        
        _primitiveType = TriangleStrip;
    }
    return self;
}

-(instancetype)initWithModel:(char*)name shader:(RWTBaseEffect*)shader vertices:(VertexTextureNorm*)vertices vertexCount:(unsigned int)vertexCount{
    
    if ((self = [super init])) {
        _name = name;
        _vertexCount = vertexCount;
        _shader = shader;
        self.Position = GLKVector3Make(0, 0, 0);
        self.rotationX = 0;
        self.rotationY = 0;
        self.rotationZ = 0;
        self.scale = GLKVector3Make(1, 1, 1);
        
        //Generate and bind vertex array buffer
        glGenVertexArraysOES(1, &_verticesArrayBuffer);
        glBindVertexArrayOES(_verticesArrayBuffer);
        
        //Generate vertex buffer
        //VerticesSize = (sizeof vertices) / (sizeof vertices[0]);
        glGenBuffers(1, &_vertexBuffer);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBufferData(GL_ARRAY_BUFFER, vertexCount * sizeof(VertexTextureNorm), vertices, GL_STATIC_DRAW);//Another option GL_DYNAMIC_DRAW
        
        // Enable vertex attributes
        glEnableVertexAttribArray(VertexAttribPosition);
        glVertexAttribPointer(VertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(VertexTextureNorm), (const GLvoid*)offsetof(VertexTextureNorm, Position));
        glEnableVertexAttribArray(VertexAttribColor);
        glVertexAttribPointer(VertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(VertexTextureNorm), (const GLvoid*)offsetof(VertexTextureNorm, Color));
        glEnableVertexAttribArray(VertexAttribTexCoord);
        glVertexAttribPointer(VertexAttribTexCoord, 2, GL_FLOAT, GL_FALSE, sizeof(VertexTextureNorm), (const GLvoid*)offsetof(VertexTextureNorm, TextureCoordinate));
        
        glEnableVertexAttribArray(VertexAttribNormal);
        glVertexAttribPointer(VertexAttribNormal, 3, GL_FLOAT, GL_FALSE, sizeof(VertexTextureNorm), (const GLvoid*)offsetof(VertexTextureNorm, Normal));
        
        glBindVertexArrayOES(0);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        
        _primitiveType = Triangles;
    }
    return self;
}

-(instancetype)initWithName:(char*)name shader:(RWTBaseEffect*)shader verticesTexture:(VertexTexture*)vertices vertexCount:(unsigned int)vertexCount indices:(GLubyte*) indices indexCount:(unsigned int)indexCount{
    if ((self = [super init])) {
        _name = name;
        _vertexCount = vertexCount;
        _indexCount = indexCount;
        _shader = shader;
        self.Position = GLKVector3Make(0, 0, 0);
        self.rotationX = 0;
        self.rotationY = 0;
        self.rotationZ = 0;
        self.scale = GLKVector3Make(1, 1, 1);
        
        //Generate and bind vertex array buffer
        glGenVertexArraysOES(1, &_verticesArrayBuffer);
        glBindVertexArrayOES(_verticesArrayBuffer);
        
        //Generate vertex buffer
        //VerticesSize = (sizeof vertices) / (sizeof vertices[0]);
        glGenBuffers(1, &_vertexBuffer);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBufferData(GL_ARRAY_BUFFER, vertexCount * sizeof(VertexTexture), vertices, GL_STATIC_DRAW);//Another option GL_DYNAMIC_DRAW
        
        //Generate index buffer
        glGenBuffers(1, &_indexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, indexCount * sizeof(GLubyte), indices, GL_STATIC_DRAW);
        
        // Enable vertex attributes
        glEnableVertexAttribArray(VertexAttribPosition);
        glVertexAttribPointer(VertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(VertexTexture), (const GLvoid*)offsetof(VertexTexture, Position));
        glEnableVertexAttribArray(VertexAttribColor);
        glVertexAttribPointer(VertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(VertexTexture), (const GLvoid*)offsetof(VertexTexture, Color));
        glEnableVertexAttribArray(VertexAttribTexCoord);
        glVertexAttribPointer(VertexAttribTexCoord, 2, GL_FLOAT, GL_FALSE, sizeof(VertexTexture), (const GLvoid*)offsetof(VertexTexture, TextureCoordinate));
        
        glBindVertexArrayOES(0);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        
        _primitiveType = TriangleList;
    }
    return self;
}

-(instancetype)initWithName:(char*)name shader:(RWTBaseEffect*)shader verticesTextureNorm:(VertexTextureNorm*)vertices vertexCount:(unsigned int)vertexCount indices:(GLubyte*) indices indexCount:(unsigned int)indexCount{
    if ((self = [super init])) {
        _name = name;
        _vertexCount = vertexCount;
        _indexCount = indexCount;
        _shader = shader;
        self.Position = GLKVector3Make(0, 0, 0);
        self.rotationX = 0;
        self.rotationY = 0;
        self.rotationZ = 0;
        self.scale = GLKVector3Make(1, 1, 1);
        
        //Generate and bind vertex array buffer
        glGenVertexArraysOES(1, &_verticesArrayBuffer);
        glBindVertexArrayOES(_verticesArrayBuffer);
        
        //Generate vertex buffer
        //VerticesSize = (sizeof vertices) / (sizeof vertices[0]);
        glGenBuffers(1, &_vertexBuffer);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBufferData(GL_ARRAY_BUFFER, vertexCount * sizeof(VertexTextureNorm), vertices, GL_STATIC_DRAW);//Another option GL_DYNAMIC_DRAW
        
        //Generate index buffer
        glGenBuffers(1, &_indexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, indexCount * sizeof(GLubyte), indices, GL_STATIC_DRAW);
        
        // Enable vertex attributes
        glEnableVertexAttribArray(VertexAttribPosition);
        glVertexAttribPointer(VertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(VertexTextureNorm), (const GLvoid*)offsetof(VertexTextureNorm, Position));
        glEnableVertexAttribArray(VertexAttribColor);
        glVertexAttribPointer(VertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(VertexTextureNorm), (const GLvoid*)offsetof(VertexTextureNorm, Color));
        glEnableVertexAttribArray(VertexAttribTexCoord);
        glVertexAttribPointer(VertexAttribTexCoord, 2, GL_FLOAT, GL_FALSE, sizeof(VertexTextureNorm), (const GLvoid*)offsetof(VertexTextureNorm, TextureCoordinate));
        
        glEnableVertexAttribArray(VertexAttribNormal);
        glVertexAttribPointer(VertexAttribNormal, 3, GL_FLOAT, GL_FALSE, sizeof(VertexTextureNorm), (const GLvoid*)offsetof(VertexTextureNorm, Normal));
        
        glBindVertexArrayOES(0);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        
        _primitiveType = TriangleList;
    }
    return self;
}
-(GLKMatrix4)modelMatrix {
    GLKMatrix4 modelMatrix = GLKMatrix4Identity;
    modelMatrix = GLKMatrix4TranslateWithVector3(modelMatrix, self.Position);
    modelMatrix = GLKMatrix4Rotate(modelMatrix, self.rotationX, 1, 0, 0);
    modelMatrix = GLKMatrix4Rotate(modelMatrix, self.rotationY, 0, 1, 0);
    modelMatrix = GLKMatrix4Rotate(modelMatrix, self.rotationZ, 0, 0, 1);
    modelMatrix = GLKMatrix4ScaleWithVector3(modelMatrix, self.scale);
    return modelMatrix;
}
-(void)render{
    _shader.modelViewMatrix = [self modelMatrix];
    [_shader prepareToDraw];
    _shader.texture = self.texture;
    glBindVertexArrayOES(_verticesArrayBuffer);
    switch (_primitiveType) {
        case TriangleList:
            glDrawElements(GL_TRIANGLES, _indexCount, GL_UNSIGNED_BYTE, 0);
            break;
        case TriangleStrip:
            glDrawArrays(GL_TRIANGLE_STRIP, 0, _vertexCount);
            break;
        case Triangles:
            glDrawArrays(GL_TRIANGLES, 0, _vertexCount);            
            break;
        default:
            break;
    }
    glBindVertexArrayOES(0);
    
    //glDisableVertexAttribArray(VertexAttribPosition);
    //glDisableVertexAttribArray(VertexAttribColor);
}

-(void)updateWithDelta:(NSTimeInterval)dt{
    
}

-(void)renderWithParentModelViewMatrix:(GLKMatrix4)parentModelViewMatrix{
    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(parentModelViewMatrix, [self modelMatrix]);
    _shader.modelViewMatrix = modelViewMatrix;
    _shader.texture = self.texture;
    [_shader prepareToDraw];
    glBindVertexArrayOES(_verticesArrayBuffer);
    switch (_primitiveType) {
        case TriangleList:
            glDrawElements(GL_TRIANGLES, _indexCount, GL_UNSIGNED_BYTE, 0);
            break;
        case TriangleStrip:
            glDrawArrays(GL_TRIANGLE_STRIP, 0, _vertexCount);
            break;
        case Triangles:
            glDrawArrays(GL_TRIANGLES, 0, _vertexCount);
            break;
        default:
            break;
    }
    glBindVertexArrayOES(0);
}

-(void)loadTexture:(NSString*)filename{
    NSError *error;
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
    
    NSDictionary *options = @{ GLKTextureLoaderOriginBottomLeft: @YES };
    GLKTextureInfo *info = [GLKTextureLoader textureWithContentsOfFile:path options:options error:&error];
    if(info == nil)
        NSLog(@"Error loading file: %@", error.localizedDescription);
    self.texture = info.name;
}
@end

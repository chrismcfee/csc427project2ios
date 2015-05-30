//
//  MyGlobal.h
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 4/26/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyGlobal : NSObject
+(NSTimer*)RunFunction:(SEL)Method After:(int)time Repeats:(BOOL)Repeats;
+(BOOL)Stop:(NSTimer*)Timer;
@end

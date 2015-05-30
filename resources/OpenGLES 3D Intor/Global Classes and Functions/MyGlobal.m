//
//  MyGlobal.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 4/26/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "MyGlobal.h"

@implementation MyGlobal

+(NSTimer*)RunFunction:(SEL)Method After:(int)time Repeats:(BOOL)Repeats;
{
    return [NSTimer scheduledTimerWithTimeInterval:time target:self selector:Method userInfo:nil repeats:Repeats];
}
+(BOOL)Stop:(NSTimer*)Timer{
    @try {
        if (Timer != nil) {
            [Timer invalidate];
            Timer = nil;
        }
        return true;
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        return false;
    }
}
@end

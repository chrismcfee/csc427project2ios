//
//  AllLightViewController.m
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 5/3/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "AllLightViewController.h"
#import "CubeNorm.h"

@interface AllLightViewController ()

@end

@implementation AllLightViewController
{
    CubeNorm *_cube;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupVertexShader:@"SimpleSpecularVertex.glsl" FragmentShader:@"SimpleSpecularFragment.glsl"];
    _shader.lightColor = GLKVector3Make(1, 1, 1);
    _shader.lightIntensity = 0.1;
    [self setupScene];
    
    _cube = [[CubeNorm alloc] initWithShader:_shader];
    _cube.scale = GLKVector3Make(0.5, 0.5, 0.5);
}

- (void)update{
    [_cube updateWithDelta:self.timeSinceLastUpdate];
}
-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [super glkView:view drawInRect:rect];
    [_cube renderWithParentModelViewMatrix:ViewMatrix];
}

-(IBAction)SliderAmbientSlided:(id)sender{
    _shader.lightIntensity = ambientSlider.value;
}
-(IBAction)SliderDiffuseSlided:(id)sender{
    _shader.lightDiffuseIntensity = diffuseSlider.value;
}
-(IBAction)SliderSpecularSlided:(id)sender{
    _shader.Shininess = specularSlider.value;
}
-(IBAction)SlidermatSpecularIntensitySlided:(id)sender{
    _shader.MatSpecularIntensity = matSpecularIntensitySlider.value;
}
-(IBAction)SliderLightDirectionSlided:(id)sender{
    GLKVector3 lightD = GLKVector3Normalize(GLKVector3Make(lightDirectionX.value, lightDirectionY.value, lightDirectionZ.value));
    _shader.lightDirection = lightD;
    labelLightX.text = [NSString stringWithFormat:@"%1.1f",lightD.x];
    labelLightY.text = [NSString stringWithFormat:@"%1.1f",lightD.y];
    labelLightZ.text = [NSString stringWithFormat:@"%1.1f",lightD.z];
}
@end

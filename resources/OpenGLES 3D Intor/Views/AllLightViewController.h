//
//  AllLightViewController.h
//  OpenGLES 3D Intor
//
//  Created by Elhassan Ahmed on 5/3/15.
//  Copyright (c) 2015 Elhassan Ahmed. All rights reserved.
//

#import "ParentGLKViewController.h"

@interface AllLightViewController : ParentGLKViewController{
    IBOutlet UISlider *ambientSlider;
    IBOutlet UISlider *diffuseSlider;
    IBOutlet UISlider *specularSlider;
    IBOutlet UISlider *matSpecularIntensitySlider;
    IBOutlet UISlider *lightDirectionX;
    IBOutlet UISlider *lightDirectionY;
    IBOutlet UISlider *lightDirectionZ;
    IBOutlet UILabel *labelLightX;
    IBOutlet UILabel *labelLightY;
    IBOutlet UILabel *labelLightZ;
}
-(IBAction)SliderAmbientSlided:(id)sender;
-(IBAction)SliderDiffuseSlided:(id)sender;
-(IBAction)SliderSpecularSlided:(id)sender;
-(IBAction)SlidermatSpecularIntensitySlided:(id)sender;
-(IBAction)SliderLightDirectionSlided:(id)sender;
@end

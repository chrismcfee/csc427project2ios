/*
 *	ViewController.h
 *	Beeautiful2ProjForiOS
 *	
 *	Created by Raina Tulpa on 5/29/15.
 *	Copyright 2015 __MyCompanyName__. All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NGLViewDelegate>
{
@private
	NGLMesh *_mesh;
	NGLCamera *_camera;
}

@end

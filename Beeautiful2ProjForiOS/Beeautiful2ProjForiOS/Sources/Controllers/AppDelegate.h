/*
 *	AppDelegate.h
 *	Beeautiful2ProjForiOS
 *	
 *	Created by Raina Tulpa on 5/29/15.
 *	Copyright 2015 __MyCompanyName__. All rights reserved.
 */

#import <UIKit/UIKit.h>

#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
	UIWindow *_window;
	ViewController *_viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) ViewController *viewController;

@end


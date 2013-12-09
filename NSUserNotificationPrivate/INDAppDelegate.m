//
//  INDAppDelegate.m
//  NSUserNotificationPrivate
//
//  Created by Indragie Karunaratne on 12/8/2013.
//  Copyright (c) 2013 Indragie Karunaratne. All rights reserved.
//

#import "INDAppDelegate.h"

@interface INDAppDelegate () <NSUserNotificationCenterDelegate>
@end

@implementation INDAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
	NSUserNotificationCenter.defaultUserNotificationCenter.delegate = self;
	// Default options from NSUserNotification
	self.poofsOnCancel = YES;
	self.identityImageHasBorder = YES;
}

- (IBAction)post:(id)sender
{
	NSUserNotification *n = [NSUserNotification new];
	n.title = self.title;
	n.subtitle = self.subtitle;
	n.informativeText = self.message;
	n.contentImage = self.contentImage;
	n.hasActionButton = YES;
	n.actionButtonTitle = @"Action";
	n.otherButtonTitle = @"Other";
	
	/** Everything below is private **/
	[n setValue:self.identityImage forKey:@"_identityImage"];
	[n setValue:@(self.identityImageHasBorder) forKey:@"_identityImageHasBorder"];
	[n setValue:@(self.ignoresDoNotDisturb) forKey:@"_ignoresDoNotDisturb"];
	[n setValue:@(self.lockscreenOnly) forKey:@"_lockscreenOnly"];
	[n setValue:@(self.poofsOnCancel) forKey:@"_poofsOnCancel"];
	if (self.showAlternateActionMenu) {
		[n setValue:@[@"Test", @"Test1"] forKey:@"_alternateActionButtonTitles"];
		[n setValue:@YES forKey:@"_alwaysShowAlternateActionMenu"];
	}
	[NSUserNotificationCenter.defaultUserNotificationCenter deliverNotification:n];
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification {
	return YES;
}

@end

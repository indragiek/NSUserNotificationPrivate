//
//  INDAppDelegate.h
//  NSUserNotificationPrivate
//
//  Created by Indragie Karunaratne on 12/8/2013.
//  Copyright (c) 2013 Indragie Karunaratne. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface INDAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) BOOL identityImageHasBorder;
@property (nonatomic, strong) NSImage *identityImage;
@property (nonatomic, strong) NSImage *contentImage;
@property (nonatomic, assign) BOOL ignoresDoNotDisturb;
@property (nonatomic, assign) BOOL lockscreenOnly;
@property (nonatomic, assign) BOOL showAlternateActionMenu;
@property (nonatomic, assign) BOOL poofsOnCancel;

- (IBAction)post:(id)sender;

@end

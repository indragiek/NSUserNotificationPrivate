//
//  INDDragAndDropImageWell.m
//  NSUserNotificationPrivate
//
//  Created by Indragie Karunaratne on 12/8/2013.
//  Copyright (c) 2013 Indragie Karunaratne. All rights reserved.
//

#import "INDDragAndDropImageWell.h"

@implementation INDDragAndDropImageWell

#pragma mark - Initialization

- (id)initWithFrame:(NSRect)frameRect
{
	if ((self = [super initWithFrame:frameRect])) {
		[self commonInitForINDDragAndDropImageWell];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder])) {
		[self commonInitForINDDragAndDropImageWell];
	}
	return self;
}

- (void)commonInitForINDDragAndDropImageWell
{
	[self registerForDraggedTypes:@[NSFilenamesPboardType]];
}

#pragma mark - NSDraggingDestination

- (NSDragOperation)draggingEntered:(id < NSDraggingInfo >)sender
{
	NSPasteboard *pboard = [sender draggingPasteboard];
	NSArray *files = [pboard propertyListForType:NSFilenamesPboardType];
	for (NSString *file in files) {
		CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)file.pathExtension, NULL);
		Boolean conforms = UTTypeConformsTo(UTI, kUTTypeImage);
		if (UTI) CFRelease(UTI);
		if (conforms) return NSDragOperationCopy;
	}
	return NSDragOperationNone;
}

- (BOOL)prepareForDragOperation:(id < NSDraggingInfo >)sender
{
	return YES;
}

- (BOOL)performDragOperation:(id < NSDraggingInfo >)sender
{
	NSPasteboard *pboard = [sender draggingPasteboard];
	NSString *file = [pboard propertyListForType:NSFilenamesPboardType][0];
	self.image = [[NSImage alloc] initWithContentsOfFile:file];
	return (self.image != nil);
}


@end

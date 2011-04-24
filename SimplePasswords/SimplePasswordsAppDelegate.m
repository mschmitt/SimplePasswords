//
//  SimplePasswordsAppDelegate.m
//  SimplePasswords
//
//  Created by Martin Schmitt on 20.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SimplePasswordsAppDelegate.h"
#import "GeneratedPasswords.h"

@implementation SimplePasswordsAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    GeneratedPasswords *gpw = [[GeneratedPasswords alloc] init];
    [self.window setContentView:[gpw view]];
}

// http://stackoverflow.com/questions/5268757/how-to-quit-cocoa-app-when-windows-close
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

- (void)orderFrontStandardAboutPanel:(id)sender {
    NSLog(@"About Box requested");
}


@end

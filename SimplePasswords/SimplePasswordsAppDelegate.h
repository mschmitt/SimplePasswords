//
//  SimplePasswordsAppDelegate.h
//  SimplePasswords
//
//  Created by Martin Schmitt on 20.04.11.
//  Copyright 2011 Martin Schmitt < mas at scsy dot de >
//

#import <Cocoa/Cocoa.h>

@interface SimplePasswordsAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end

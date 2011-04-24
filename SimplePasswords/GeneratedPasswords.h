//
//  GeneratedPasswords.h
//  SimplePasswords
//
//  Created by Martin Schmitt on 20.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "DictBasedPassword.h"
#include "RandomPassword.h"


@interface GeneratedPasswords : NSViewController {
@private
    IBOutlet id modeSelector;
    IBOutlet id secureStrengthSelector;
    IBOutlet id secureStrengthLabel;
    IBOutlet id generatedPassword1;
    IBOutlet id generatedPassword2;
    IBOutlet id generatedPassword3;
    IBOutlet id generatedPassword4;
    IBOutlet id generatedPassword5;
    int selectedMode;
    int selectedStrength;
    id dictBasedPassword;
    id randomPassword;
    }


- (IBAction)selectMode:(id)sender;
- (IBAction)selectStrength:(id)sender;
- (IBAction)reload:(id)sender;

- (void)updateStrengthLabel;
- (void)updateGeneratedPasswords;

@end

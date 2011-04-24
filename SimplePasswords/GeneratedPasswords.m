//
//  GeneratedPasswords.m
//  SimplePasswords
//
//  Created by Martin Schmitt on 20.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GeneratedPasswords.h"


@implementation GeneratedPasswords

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        NSLog(@"View Initialization complete.");
    }
    return self;
}

- (void)awakeFromNib {
    selectedMode     = [modeSelector selectedSegment];
    if (2 == selectedMode){
        [secureStrengthSelector setHidden:NO];
        [secureStrengthLabel setHidden:NO];
    }else{
        [secureStrengthSelector setHidden:YES];
        [secureStrengthLabel setHidden:YES];
    }
    selectedStrength = [secureStrengthSelector intValue];
    [self updateStrengthLabel];
    dictBasedPassword = [[DictBasedPassword alloc] init];    
    randomPassword = [[RandomPassword alloc] init];
    [self updateGeneratedPasswords];
}

- (IBAction)selectMode:(id)sender {
    selectedMode = [modeSelector selectedSegment];
    if (2 == selectedMode){
        [secureStrengthSelector setHidden:NO];
        [secureStrengthLabel setHidden:NO];
    }else{
        [secureStrengthSelector setHidden:YES];
        [secureStrengthLabel setHidden:YES];
    }
    NSLog(@"New selectedMode is: %d", selectedMode);
    [self updateGeneratedPasswords];
}


- (IBAction)selectStrength:(id)sender {
    selectedStrength = [secureStrengthSelector intValue];
    [self updateStrengthLabel];
    NSLog(@"Strength selector change: %d", selectedStrength);
    [self updateGeneratedPasswords];
}

- (IBAction)reload:(id)sender{
    [self updateGeneratedPasswords];
}


- (void)updateGeneratedPasswords{
    if (0 == selectedMode){
        // Simple passwords requested
        [generatedPassword1 setStringValue:[dictBasedPassword getSimplePassword]];
        [generatedPassword2 setStringValue:[dictBasedPassword getSimplePassword]];
        [generatedPassword3 setStringValue:[dictBasedPassword getSimplePassword]];
        [generatedPassword4 setStringValue:[dictBasedPassword getSimplePassword]];
        [generatedPassword5 setStringValue:[dictBasedPassword getSimplePassword]];
    }else if (1 == selectedMode){
        // Simple passwords requested
        [generatedPassword1 setStringValue:[dictBasedPassword getBetterPassword]];
        [generatedPassword2 setStringValue:[dictBasedPassword getBetterPassword]];
        [generatedPassword3 setStringValue:[dictBasedPassword getBetterPassword]];
        [generatedPassword4 setStringValue:[dictBasedPassword getBetterPassword]];
        [generatedPassword5 setStringValue:[dictBasedPassword getBetterPassword]];     
    }else if (2 == selectedMode){
        // Stronger passwords requested
        [generatedPassword1 setStringValue:[randomPassword getRandomPassword:selectedStrength]];
        [generatedPassword2 setStringValue:[randomPassword getRandomPassword:selectedStrength]];
        [generatedPassword3 setStringValue:[randomPassword getRandomPassword:selectedStrength]];
        [generatedPassword4 setStringValue:[randomPassword getRandomPassword:selectedStrength]];
        [generatedPassword5 setStringValue:[randomPassword getRandomPassword:selectedStrength]];        
    }
}

- (void)updateStrengthLabel {
    [secureStrengthLabel setStringValue:[NSString stringWithFormat:@"Length for \"Stronger\" passwords: %i", selectedStrength]];
}


- (void)dealloc
{
    [randomPassword release];
    [dictBasedPassword release];
    [super dealloc];
}

@end

//
//  RandomPassword.m
//  SimplePasswords
//
//  Created by Martin Schmitt on 22.04.11.
//  Copyright 2011 Martin Schmitt < mas at scsy dot de >
//

#import "RandomPassword.h"


@implementation RandomPassword

- (id)getRandomPassword:(int)passwordLength {
    NSLog(@"Request for random password of length: %d", passwordLength);
    NSString *theCharacters = @"abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ234567879";
    NSMutableString *generatedPassword = [[[NSMutableString alloc] init] autorelease];
    while ([generatedPassword length] < passwordLength){
        int random = arc4random() % [theCharacters length];
        NSString *theChar = [theCharacters substringWithRange:[theCharacters rangeOfComposedCharacterSequenceAtIndex:random]];
        [generatedPassword appendString:theChar];
    }
    return generatedPassword;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end

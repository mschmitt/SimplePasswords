//
//  DictBasedPassword.m
//  SimplePasswords
//
//  Created by Martin Schmitt on 21.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DictBasedPassword.h"

@implementation DictBasedPassword

- (id)init
{
    self = [super init];
    if (self) {
        specialChars = [[NSArray arrayWithObjects:@"-", @"+", @".", @"*", nil] retain];
        // Initialization code here.
        // -> Read File                            /// FIXME: Error handling
        wordListFile = [[NSBundle mainBundle] pathForResource: @"words" ofType: nil];
        NSLog(@"The wordListFile is: %@", wordListFile);
        NSString *wordList = [NSString stringWithContentsOfFile:wordListFile encoding:NSUTF8StringEncoding error:nil];
        // -> Process word by word
        NSArray *wordListArray = [wordList componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]]; 
        NSLog(@"Loaded %u words from word list: %@", [wordListArray count], wordListFile);
        // -> Toss into 4- and 3-letter arrays
        threeLetterWords = [[NSMutableArray alloc] init];
        fourLetterWords  = [[NSMutableArray alloc] init];
        for (NSString *aWord in wordListArray) {
            if ((3 == [aWord length]) && (3 == [aWord lengthOfBytesUsingEncoding:NSUTF8StringEncoding])){
                [threeLetterWords addObject:aWord];
            }else if ((4 == [aWord length]) && (4 == [aWord lengthOfBytesUsingEncoding:NSUTF8StringEncoding])){
                [fourLetterWords addObject:aWord];
            }                
        }
        NSLog(@"Three letter words found: %u", [threeLetterWords count]);
        NSLog(@"Four letter words found : %u", [fourLetterWords  count]);
    }
    
    return self;
}

- (id)getSimplePassword{
    // Return password consisting of:
    // - Random 4 or 3 letter word
    // - Random special character
    // - Random 4 or 3 letter word
    NSMutableString *generatedPassword = [[[NSMutableString alloc] init] autorelease];
    if (arc4random() % 2){
        [generatedPassword appendString:[self randomThreeLetterWord]];        
        [generatedPassword appendString:[self randomSpecialChar]];
        [generatedPassword appendString:[self randomFourLetterWord]];
    }else{
        [generatedPassword appendString:[self randomFourLetterWord]];
        [generatedPassword appendString:[self randomSpecialChar]];
        [generatedPassword appendString:[self randomThreeLetterWord]];        

    }
    return generatedPassword;    
}

- (id)getBetterPassword{
    // Return password consisting of:
    // - Random 4 or 3 letter word
    // - 3-figure random number and special character or: special character and 3-figure random number
    // - Random 4 or 3 letter word
    NSMutableString *generatedPassword = [[[NSMutableString alloc] init] autorelease];
    NSString *randomWord1;
    NSString *randomWord2;
    NSString *randomNumberString;
    if (arc4random() % 2){
        randomWord1 = [self randomThreeLetterWord];
        randomWord2 = [self randomFourLetterWord];
    }else{
        randomWord1 = [self randomFourLetterWord];
        randomWord2 = [self randomThreeLetterWord];
    }
    [generatedPassword appendString:randomWord1];
   
    randomNumberString = [NSString stringWithFormat:@"%.3i", arc4random() % 1000];
    
    if (arc4random() % 2){
        [generatedPassword appendString:[self randomSpecialChar]];
        [generatedPassword appendString:randomNumberString];
    }else{
        [generatedPassword appendString:randomNumberString];
        [generatedPassword appendString:[self randomSpecialChar]];
    }
    
    [generatedPassword appendString:randomWord2];
    
    return generatedPassword;
    
}

- (id)randomThreeLetterWord {
    return [threeLetterWords objectAtIndex:arc4random() % [threeLetterWords count]];
}

- (id)randomFourLetterWord {
    return [fourLetterWords objectAtIndex:arc4random() % [fourLetterWords count]];
}
- (id)randomSpecialChar {
    return [specialChars objectAtIndex:arc4random() % [specialChars count]];
}

     
- (void)dealloc
{
    [fourLetterWords release];
    [threeLetterWords release];
    [specialChars release];
    [super dealloc];
}

@end

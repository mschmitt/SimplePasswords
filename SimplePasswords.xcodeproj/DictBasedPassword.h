//
//  DictBasedPassword.h
//  SimplePasswords
//
//  Created by Martin Schmitt on 21.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DictBasedPassword : NSObject {
@private
    NSString *wordListFile;
    NSArray *specialChars;
    NSMutableArray *threeLetterWords;
    NSMutableArray *fourLetterWords;
}
- (id)getSimplePassword;
- (id)getBetterPassword;
- (id)randomThreeLetterWord;
- (id)randomFourLetterWord;
- (id)randomSpecialChar;

@end

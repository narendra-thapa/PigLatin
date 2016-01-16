//
//  main.m
//  PigLatin_SmallerVersion
//
//  Created by Narendra Thapa on 2016-01-15.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Tokenization.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *testString = @"Koola Choopse hoho s pao";
        NSString *newString = [testString stringByPigLatinization];
        NSLog(@"%@", newString);
    }
    return 0;
}

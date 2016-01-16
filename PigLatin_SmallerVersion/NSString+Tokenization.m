//
//  NSString+Tokenization.m
//  PigLatin_SmallerVersion
//
//  Created by Narendra Thapa on 2016-01-15.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "NSString+Tokenization.h"

@implementation NSString (Tokenization)

-(NSString *)stringByPigLatinization {
    
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
    NSArray *originalWords = [self componentsSeparatedByString:@" "];
    NSLog(@"OriginalWords %@", originalWords);
    NSUInteger wordCount = [originalWords count];
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < wordCount; i++)
    {
    NSString *firstWord = [originalWords objectAtIndex:i];
    NSUInteger wordLength = [firstWord length];
    NSLog(@"first word length: %lu", (unsigned long)wordLength);
    NSArray *splitedWordTemper = [firstWord componentsSeparatedByCharactersInSet:vowels];
    NSString *firstpart = [splitedWordTemper objectAtIndex:0];
    NSUInteger consonantLength = [firstpart length];
    NSString *secondpart = [firstWord substringFromIndex:consonantLength];
    NSMutableArray *thirdpart = [[NSMutableArray alloc] init];
    [thirdpart addObject:secondpart];
    [thirdpart addObject:firstpart];
    [thirdpart addObject:@"ay"];
    NSString *finalString = [thirdpart componentsJoinedByString:@""];
    [finalArray addObject:finalString];
    }
    NSString *finalResult = [finalArray componentsJoinedByString:@" "];
    
    return finalResult;
}

@end

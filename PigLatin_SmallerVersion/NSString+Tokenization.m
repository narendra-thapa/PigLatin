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
    
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];          // Character set of vowels
    NSArray *originalWords = [self componentsSeparatedByString:@" "];                               // Splits the string into individual words
    NSLog(@"OriginalWords %@", originalWords);
    NSUInteger wordCount = [originalWords count];                                                   // Counts the number of words in the array
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];                                     // Array to hold rearranged words
    
    for (NSUInteger i = 0; i < wordCount; i++)                                                      // Loops for number of words
    {
    NSString *singleWord = [originalWords objectAtIndex:i];                                         // Extracts the words from array
    NSUInteger wordLength = [singleWord length];
    NSLog(@"Word length: %lu", (unsigned long)wordLength);
    NSArray *splitedWordHolder = [singleWord componentsSeparatedByCharactersInSet:vowels];          // Extracts characters before first vowel is encountered
    NSString *firstpart = [splitedWordHolder objectAtIndex:0];                                      // Saves the string of consonants before vowel
    NSUInteger consonantLength = [firstpart length];                                                // Checks length of consonant string
    NSString *secondpart = [singleWord substringFromIndex:consonantLength];                         // Substrings the original word omitting the first consonants
    NSMutableArray *thirdpart = [[NSMutableArray alloc] init];                                      // Temp array to hold split parts
    [thirdpart addObject:secondpart];                                                               // 1st part of word starting with vowel
    [thirdpart addObject:firstpart];                                                                // 2nd part of word starting with first consonant
    [thirdpart addObject:@"ay"];                                                                    // 3rd part of word with "ay"
    NSString *finalString = [thirdpart componentsJoinedByString:@""];                               // Joins all three to form a word
    [finalArray addObject:finalString];                                                             // Adds it to final array
    }
    NSString *finalResult = [finalArray componentsJoinedByString:@" "];                             // Joins all words with space in between
    return finalResult;                                                                             // Returns rearranged string
}

@end

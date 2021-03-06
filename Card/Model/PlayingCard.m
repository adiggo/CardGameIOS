//
//  PlayingCard.m
//  Card
//
//  Created by Xiaoping Li on 6/18/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)othercards
{
    int score = 0;
    
    
    if ([othercards count] == 1){
        PlayingCard *otherCard = [othercards firstObject];
        if (otherCard.rank == self.rank){
            score = 4;
        }else if ([otherCard.suit isEqualToString: self.suit]){
            score = 1;
        }
    }
    
    
    return score;
}


- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♥︎",@"♣︎",@"♦︎",@"♠︎"];
}
-(void) setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",
             @"3",@"4",@"5",
             @"6",@"7", @"8",
             @"9",@"10",@"J",
             @"Q",@"K"];
}

+ (NSUInteger) maxRank
{
    return [[self rankStrings] count]-1;
}

-(void)setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@end

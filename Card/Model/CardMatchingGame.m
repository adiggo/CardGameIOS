//
//  CardMatchingGame.m
//  Card
//
//  Created by Xiaoping Li on 6/23/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score; //set score privately in the implementation file
@property (nonatomic, strong) NSMutableArray *cards;
//in objective c we can't define
// the array inner type
// all we do is to be sure comment
// what we intend.
@end
//readwrite is the default behavior
//here we use readwrite is because that
//we have declared the property as readonly in
//header file.


@implementation CardMatchingGame

//lazy instantiation
- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self){
        for (int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if (card){
            [self.cards addObject:card];
            }else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    //protect the cards
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


//choose action, if you click choose the card, then it will be choosed if it has not been chosen before
- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index]; //choose a new card
    if (!card.isMatched){
        if (card.isChosen){
            card.chosen = NO;
        }else{
            for (Card *otherCard in self.cards){
              //if othercard is chosen, and it is not matched.
                if (otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match : @[otherCard ]];
                    if (matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}
@end

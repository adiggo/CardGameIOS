//
//  ViewController.m
//  Card
//
//  Created by Xiaoping Li on 6/17/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
            
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic)int flipCount;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController


- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButton count] usingDeck:[self createDeck] ];
    return _game;
}

- (Deck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"flip :%d",self.flipCount];
    NSLog(@"flipCount = %d", self.flipCount);
}
            
- (IBAction)cardReverse:(UIButton*)sender {
    
    int chosenButtonIndex = [self.cardButton indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
    self.flipCount++;

    
}

- (void)updateUI
{
    for (UIButton *button in self.cardButton){
        int buttonIndex = [self.cardButton indexOfObject:button];
        Card *card = [self.game cardAtIndex:buttonIndex];
        [button setTitle :[self titleForCard : card] forState : UIControlStateNormal ];
        [button setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        button.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",
        self.game.score ];
        
    }
}

- (NSString *)titleForCard : (Card *) card
{
    return card.isChosen ? card.contents : @"" ;
}

- (UIImage *)backgroundImageForCard : (Card *) card
{
    return [UIImage imageNamed : card.isChosen ? @"cardfront" : @"cardback" ];
}


@end

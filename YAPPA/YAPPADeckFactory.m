#import "YAPPADeckFactory.h"

@implementation YAPPADeckFactory

+ (NSArray *) createDeck: (NSString *)type {
    
    NSArray *deck;
    
    if (type == nil || [type isEqualToString: DECK_DEFAULT]) {
        deck = [self createDefaultDeck];
    }
    else if([type isEqualToString: DECK_TSHIRT]) {
        deck = [self createTShirtDeck];
    }
    else {
        [NSException raise:@"Invalid deck name." format:@"Deck %@ is invalid.", type];
    }
    
    return deck;
}

+ (NSArray *) createDefaultDeck {
    return [[NSArray alloc] initWithObjects:@"0", @"1/2", @"1", @"2", @"3", @"5", @"8", @"13", @"20", @"40", @"100", @"∞", @"?", nil];
}

+ (NSArray *) createTShirtDeck {
    return [[NSArray alloc] initWithObjects:@"XS", @"S", @"M", @"L", @"XL", @"∞", @"?", nil];
}
@end

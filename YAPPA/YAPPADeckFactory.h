#import <Foundation/Foundation.h>

#define DECK_DEFAULT @"default"
#define DECK_TSHIRT @"tshirt"

@interface YAPPADeckFactory : NSObject
+ (NSArray *) createDeck: (NSString *)type;
@end

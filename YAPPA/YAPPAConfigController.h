#import <UIKit/UIKit.h>
#import "YAPPADeckChangedProtocol.h"
#define DECK_DEFAULT_SEG 0
#define DECK_TSHIRT_SEG 1

@interface YAPPAConfigController : UIViewController
@property(strong, nonatomic) NSString *deckType;
@property(weak, nonatomic) id<YAPPADeckChangedProtocol> delegate;
@end

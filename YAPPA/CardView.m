#import "CardView.h"

#define CARD_CORNER_RADIUS 10.0
#define FONT_RATIO 0.5

@implementation CardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawCard];
    
//    [[UIColor blackColor] setStroke];
//    [roundedRect stroke];
    
    [self drawCardText: self.cardText];
    
}

- (void) drawCard {
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CARD_CORNER_RADIUS];
    
    [roundedRect addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
}

- (void) drawCardText:(NSString *) text {
    CGPoint middle = [self calculateMiddlePointOfCard];
    UIFont *font = [self generateFontWithCorrectSize];
    
    NSAttributedString *attributedText = [self generateCardContentWithFont: font];

    CGSize textSize = [attributedText size];
    CGPoint textOrigin = [self calculateTextOrigin:middle withTextSize:textSize];

    [attributedText drawAtPoint:textOrigin];
}

- (CGPoint) calculateMiddlePointOfCard {
    return CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
}

- (UIFont *) generateFontWithCorrectSize {
    return [UIFont systemFontOfSize:self.bounds.size.width * FONT_RATIO];
}

- (CGPoint) calculateTextOrigin: (CGPoint) middleOfCard
                   withTextSize: (CGSize) textSize {
    
    return CGPointMake(middleOfCard.x - textSize.width/2.0,
                       middleOfCard.y - textSize.height/2.0);
    
}

- (NSAttributedString *) generateCardContentWithFont: (UIFont *) font {
    return [[NSAttributedString alloc] initWithString:self.cardText attributes:@{NSFontAttributeName : font,
                               NSShadowAttributeName : [self generateTextShadow]}];
}

- (NSShadow *) generateTextShadow
{
    NSShadow *shadowDic=[[NSShadow alloc] init];
    [shadowDic setShadowBlurRadius:2.0];
    [shadowDic setShadowColor:[UIColor grayColor]];
    [shadowDic setShadowOffset:CGSizeMake(3, 3)];
    return shadowDic;
}


- (void) setFaceUp:(BOOL)faceUp {
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

- (void) setCardText:(NSString *)cardText {
    _cardText = cardText;
    [self setNeedsDisplay];
}

@end

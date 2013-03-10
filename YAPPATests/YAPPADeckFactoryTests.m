#import "YAPPADeckFactoryTests.h"
#import "YAPPADeckFactory.h"

@implementation YAPPADeckFactoryTests

- (void)setUp
{
    [super setUp];    
}

- (void)tearDown
{    
    [super tearDown];
}

- (void)testCreateDeckWithTypeNullShouldReturnDeckDefault
{
    NSArray *expectedDeck = [[NSArray alloc] initWithObjects:@"0", @"1/2", @"1", @"2", @"3", @"5", @"8", @"13", @"20", @"40", @"100", @"∞", @"?", nil];

    NSArray *deck = [YAPPADeckFactory createDeck:nil];
    
    STAssertEqualObjects(expectedDeck, deck, @"deck should be deck_default");
}

- (void)testCreateDeckWithTypeDeckDefault
{
    NSArray *expectedDeck = [[NSArray alloc] initWithObjects:@"0", @"1/2", @"1", @"2", @"3", @"5", @"8", @"13", @"20", @"40", @"100", @"∞", @"?", nil];
    
    NSArray *deck = [YAPPADeckFactory createDeck: DECK_DEFAULT];
    
    STAssertEqualObjects(expectedDeck, deck, @"deck should be deck_default");
}

- (void)testCreateDeckWithTypeTshirtDeck
{
    NSArray *expectedDeck = [[NSArray alloc] initWithObjects:@"XS", @"S", @"M", @"L", @"XL", @"∞", @"?", nil];
    
    NSArray *deck = [YAPPADeckFactory createDeck: DECK_TSHIRT];
    
    STAssertEqualObjects(expectedDeck, deck, @"deck should be deck_tshirt");
}

- (void)testCreateDeckWithInvalidTypeShouldRaiseException
{
    STAssertThrows([YAPPADeckFactory createDeck: @"invalidDeckName"], @"should raise exception when an invalid deck name is used.");
}
@end

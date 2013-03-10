#import "YAPPAListCardsViewController.h"
#import "CardView.h"
#import "YAPPADeckFactory.h"

@interface YAPPAListCardsViewController ()
@property(strong, nonatomic) NSArray *deck;
@end

@implementation YAPPAListCardsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.deck = [YAPPADeckFactory createDeck: DECK_DEFAULT];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.deck.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIButton *button = (UIButton *)[cell viewWithTag:100];
    [button setTitle:[NSString stringWithFormat:@"%@", [self.deck objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString: @"showCard"]) {
        UILabel *buttonLabel = [(UIButton *) sender titleLabel];
        [[segue destinationViewController] setCardText: [buttonLabel text]];
    }
}

@end

#import "YAPPAListCardsViewController.h"
#import "CardView.h"

@interface YAPPAListCardsViewController ()
@property(strong, nonatomic) NSArray *deck;
@end

@implementation YAPPAListCardsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.deck = [NSArray arrayWithObjects:@"0", @"1/2", @"1", @"3", @"13", @"100", nil];
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

@end

#import "YAPPAViewController.h"
#import "CardView.h"

@interface YAPPAViewController ()
@property (weak, nonatomic) IBOutlet CardView *cardView;
@end

@implementation YAPPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self cardView] setCardText: [self cardText]];
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    if(self.cardView.faceUp) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else {
        [self flipCard];
    }
}

- (void) flipCard {
    [UIView transitionWithView:self.cardView
                duration:0.5
                options:UIViewAnimationOptionTransitionFlipFromLeft
                animations:^{
                    self.cardView.faceUp  = !self.cardView.faceUp;
                }
                completion:NULL];
}

@end

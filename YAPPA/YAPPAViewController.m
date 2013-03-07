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


@end

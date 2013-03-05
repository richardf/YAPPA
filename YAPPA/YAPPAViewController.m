#import "YAPPAViewController.h"
#import "CardView.h"

@interface YAPPAViewController ()
@property (weak, nonatomic) IBOutlet CardView *cardView;
@end

@implementation YAPPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self cardView].cardText = @"D";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

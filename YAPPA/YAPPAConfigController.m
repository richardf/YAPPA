#import "YAPPAConfigController.h"
#import "YAPPADeckFactory.h"
@interface YAPPAConfigController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *deckTypeSegmentedControl;

@end

@implementation YAPPAConfigController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.deckTypeSegmentedControl.selectedSegmentIndex = [self indexOfDeckType: self.deckType];
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changeDeckType:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex == DECK_DEFAULT_SEG) {
        [self.delegate deckChangedToType:DECK_DEFAULT];
    } else if (sender.selectedSegmentIndex == DECK_TSHIRT_SEG) {
        [self.delegate deckChangedToType:DECK_TSHIRT];
    }
}

-(NSUInteger) indexOfDeckType: (NSString *) deckType {
    if([deckType isEqualToString: DECK_DEFAULT]) {
        return DECK_DEFAULT_SEG;
    }
    else {
        return DECK_TSHIRT_SEG;
    }
}

@end

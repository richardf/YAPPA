//
//  YAPPAConfigController.m
//  YAPPA
//
//  Created by Richard Fuchshuber on 12/03/13.
//  Copyright (c) 2013 Richard Fuchshuber. All rights reserved.
//

#import "YAPPAConfigController.h"

@interface YAPPAConfigController ()

@end

@implementation YAPPAConfigController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

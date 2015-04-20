//
//  ColorDisplayViewController.m
//  IOS_HW02_kerenm
//
//  Created by Man, Keren on 4/19/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "ColorDisplayViewController.h"

@interface ColorDisplayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblDisplayCount;
@end

@implementation ColorDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = _displayColor;
    self.lblDisplayCount.text = [NSString stringWithFormat:@"Presented %i times", self.displayCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnDismiss_Clicked:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end

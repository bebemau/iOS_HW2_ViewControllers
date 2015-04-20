//
//  ColorTabViewController.m
//  IOS_HW02_kerenm
//
//  Created by Man, Keren on 4/19/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "ColorTabViewController.h"
#import "ColorDisplayViewController.h"
#import "AppDelegate.h"
#import "UIColor+UWExtensions.h"

@interface ColorTabViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtRed;
@property (weak, nonatomic) IBOutlet UITextField *txtGreen;
@property (weak, nonatomic) IBOutlet UITextField *txtBlue;
@property NSMutableDictionary* ColorCount;
@property AppDelegate *appDelegate;

@end

@implementation ColorTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnRed_Clicked:(id)sender {
    [self displayColor: [UIColor redColor] colorKey:@"Red"];
}

- (IBAction)btnGreen_Clicked:(id)sender {
    [self displayColor: [UIColor greenColor] colorKey:@"Green" ];
}

- (IBAction)btnBlue_Clicked:(id)sender {
    [self displayColor: [UIColor blueColor] colorKey:@"Blue" ];
}

- (void) displayColor: (UIColor*)colorSelected colorKey: (NSString*)key{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ColorDisplayVC"];
    
    //set color
    ((ColorDisplayViewController*)vc).displayColor = colorSelected;
    
    //set count
    int count = [[self.appDelegate.ColorDictionary objectForKey:key] intValue] + 1;
    [self.appDelegate.ColorDictionary setObject:[NSNumber numberWithInt:count] forKey:key];
    ((ColorDisplayViewController*)vc).displayCount = count;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)btnCustom_Clicked:(id)sender {
    if ([self.txtBlue.text  isEqual: @""] || [self.txtGreen.text  isEqual: @""] || [self.txtGreen.text  isEqual: @""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"All fields are required"
                                                        message:@"Please enter all values."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{
        
        UIColor *color = [UIColor colorWithRed: self.txtRed.text.floatValue green: self.txtGreen.text.floatValue blue: self.txtBlue.text.floatValue alpha:1];
        [self displayColor:color colorKey:@"Custom"];
    }
}

- (IBAction)btnRandom_Clicked:(id)sender {
    UIColor *color = [UIColor uw_randomColor];
    [self displayColor:color colorKey:@"Random"];
}

@end

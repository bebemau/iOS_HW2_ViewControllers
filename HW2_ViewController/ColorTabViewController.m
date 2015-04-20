//
//  ColorTabViewController.m
//  IOS_HW02_kerenm
//
//  Created by Man, Keren on 4/19/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "ColorTabViewController.h"
#import "ColorDisplayViewController.h"

@interface ColorTabViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtRed;
@property (weak, nonatomic) IBOutlet UITextField *txtGreen;
@property (weak, nonatomic) IBOutlet UITextField *txtBlue;

@end

@implementation ColorTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ColorCount = [[NSMutableDictionary alloc]initWithCapacity:5];
    [self.ColorCount setObject:[NSNumber numberWithInt:0] forKey:@"Red"];
    [self.ColorCount setObject:[NSNumber numberWithInt:0] forKey:@"Green"];
    [self.ColorCount setObject:[NSNumber numberWithInt:0] forKey:@"Blue"];
    [self.ColorCount setObject:[NSNumber numberWithInt:0] forKey:@"Custom"];
    [self.ColorCount setObject:[NSNumber numberWithInt:0] forKey:@"Random"];
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
    int count = [[self.ColorCount objectForKey:key] intValue] + 1;
    [self.ColorCount setObject:[NSNumber numberWithInt:count] forKey:key];
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

@end

//
//  DataTabViewController.m
//  IOS_HW02_kerenm
//
//  Created by Man, Keren on 4/19/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "DataTabViewController.h"
#import "ColorTabViewController.h"
#import "AppDelegate.h"

@interface DataTabViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tblData;
@property AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UILabel *lblRedCount;
@property (weak, nonatomic) IBOutlet UILabel *lblGreenCount;
@property (weak, nonatomic) IBOutlet UILabel *lblBlueCount;
@property (weak, nonatomic) IBOutlet UILabel *lblCustomCount;
@property (weak, nonatomic) IBOutlet UILabel *lblRandomCount;

@end

@implementation DataTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    //self.tblData.delegate = self;
    
}

- (void) viewWillAppear:(BOOL)animated{
    
    //construct table
    self.lblRedCount.text = [[self.appDelegate.ColorDictionary objectForKey:@"Red"] stringValue];
    self.lblGreenCount.text = [[self.appDelegate.ColorDictionary objectForKey:@"Green"] stringValue];
    self.lblBlueCount.text = [[self.appDelegate.ColorDictionary objectForKey:@"Blue"] stringValue];
    self.lblCustomCount.text = [[self.appDelegate.ColorDictionary objectForKey:@"Custom"] stringValue];
    self.lblRandomCount.text = [[self.appDelegate.ColorDictionary objectForKey:@"Random"] stringValue];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnReset_Clicked:(id)sender {
    
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.appDelegate.ColorDictionary.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSArray *keys = [self.appDelegate.ColorDictionary allKeys];
//    //NSArray *values = [self.appDelegate.ColorDictionary allValues];
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColorCell"];
////    cell.textLabel.text = [keys objectAtIndex:[indexPath row]];
////    NSLog(@"Cell is %@", [keys objectAtIndex:indexPath.row]);
//    return cell;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

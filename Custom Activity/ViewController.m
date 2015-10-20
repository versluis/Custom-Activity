//
//  ViewController.m
//  Custom Activity
//
//  Created by Jay Versluis on 20/10/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "ViewController.h"
#import "MyActivity.h"

@interface ViewController ()
@property (nonatomic, strong) MyActivity *customActivity;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareText:(id)sender {
    
    // some text we want to share
    NSString *theMessage = @"This is a message we would like to share";
    NSArray *items = @[theMessage];
    
    // create an array of custom activities
    NSArray *activities = @[self.customActivity];
    
    // configure an activity view controller
    UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:activities];
    
    // and present it
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction)shareImage:(id)sender {
    
    // an image we want to share
    UIImage *image = [UIImage imageNamed:@"construction-hires"];
    NSArray *items = @[image];
    
    // create an array of custom activities
    NSArray *activities = @[self.customActivity];
    
    // configure an activity view controller
    UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:activities];
    
    // and present it
    [self presentViewController:controller animated:YES completion:nil];
}

- (MyActivity *)customActivity {
    
    if (!_customActivity) {
        _customActivity = [[MyActivity alloc]init];
        
        // any setup for our activity can be done here
    }
    return _customActivity;
}

@end

//
//  MyActivity.m
//  Custom Activity
//
//  Created by Jay Versluis on 20/10/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "MyActivity.h"

@interface MyActivity ()
@property (nonatomic, strong) NSArray *activityItems;
@end

@implementation MyActivity

# pragma mark - properties and methods we must override

- (NSString *)activityType {
    
    // a unique identifier
    return @"com.versluis.custom-activity";
}

- (NSString *)activityTitle {
    
    // a title shown in the sharing menu
    return @"Custom Activity";
}

- (UIImage *)activityImage {
    
    // an image to go with our option
    return [UIImage imageNamed:@"construction"];
}

+ (UIActivityCategory)activityCategory {
    
    // which row our activity is shown in
    // top row is sharing, bottom row is action
    return UIActivityCategoryAction;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    
    // return YES for anything that our activity can deal with
    for (id item in activityItems) {
        
        // we can deal with strings and images
        if ([item isKindOfClass:[NSString class]] || [item isKindOfClass:[UIImage class]]) {
            return YES;
        }
    }
    // for everything else, return NO
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    
    // anything we need to prepare, now's the chance
    // custom UI, long running calculations, etc
    
    // also: grab a reference to the objects our user wants to share/action
    self.activityItems = activityItems;
}

# pragma mark - optional methods we can override

- (UIViewController *)activityViewController {
    
    // return a custom UI if we need it,
    // or the standard activity view controller if we don't
    return nil;
}

- (void)performActivity {
    
    // the main thing our activity does
    
    // act upon each item here
    for (id item in self.activityItems) {
        NSLog(@"YEY - someone wants to use our activity!");
        NSLog(@"They used this object: %@", [item description]);
    }
    
    // notify iOS that we're done here
    // return YES if we were successful, or NO if we were not
    [self activityDidFinish:YES];
}

@end

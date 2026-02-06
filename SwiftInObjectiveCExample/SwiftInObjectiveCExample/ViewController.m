//
//  ViewController.m
//  SwiftInObjectiveCExample
//
//  Created by Sashi Jagadam on 06/02/26.
//

#import "ViewController.h"
#import "SwiftInObjectiveCExample-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Create Swift class object
    SwiftUtility *swiftObj = [[SwiftUtility alloc] init];
    //Call Swift class method
    [swiftObj showMessage];
    //Call swift methods with return values
    NSInteger result = [swiftObj addNumbersWithA:10 b:200];
    NSLog(@"Result: %ld", (long)result);
    
    //Use Swift-created UIKit object
    UILabel *label = [swiftObj getWelcomeLabel];
    label.frame = CGRectMake(40, 200, 300, 40);
    [self.view addSubview:label];
}


@end

//
//  InfoViewController.m
//  Calculator
//
//  Created by MF839-011 on 2016. 6. 16..
//  Copyright © 2016년 MyCompany. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Text = %@", self.myString);
    
    self.myLabel.text = self.myString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)close:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)changeColor:(UIColor *)newColor {
    if ([self.delegate respondsToSelector:@selector(changeColor:)]) {
        [self.delegate changeColor:[UIColor redColor]];
    }
}
@end

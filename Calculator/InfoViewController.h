//
//  InfoViewController.h
//  Calculator
//
//  Created by MF839-011 on 2016. 6. 16..
//  Copyright © 2016년 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoViewProtocol <NSObject>
- (void)changeColor:(UIColor *)newColor;
@end

@interface InfoViewController : UIViewController

@property (nonatomic, weak) NSString *myString;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property (nonatomic, strong) id<InfoViewProtocol> delegate;

- (IBAction)close:(id)sender;

- (IBAction)changeColor:(UIColor *)newColor;

@end

//
//  ViewController.h
//  Calculator
//
//  Created by MF839-011 on 2016. 6. 15..
//  Copyright © 2016년 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;


- (IBAction)clickDigit:(id)sender;

- (void)processDigit:(int)digit;
- (void)processOp:(char)theOp;
- (void)storeFracPart;


// 산술 연산키
- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

// 기타키
- (IBAction)clickOver:(id)sender;
- (IBAction)clickEquals:(id)sender;
- (IBAction)clickClear:(id)sender;

- (void)setButtonEnabled:(BOOL)val;

//@property (weak, nonatomic) IBOutlet UIButton *myButton;
//@property (weak, nonatomic) IBOutlet UIButton *myButton2;
//@property (weak, nonatomic) IBOutlet UIButton *myButton3;
//@property (weak, nonatomic) IBOutlet UIButton *myButton4;

//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myButtonCol;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *opButtons;
- (IBAction)openInfoView:(id)sender;


- (IBAction)openNewView:(id)sender;


@end


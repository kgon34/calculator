//
//  ViewController.m
//  Calculator
//
//  Created by MF839-011 on 2016. 6. 15..
//  Copyright © 2016년 MyCompany. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "InfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[Calculator alloc] init];
    
    //self.myButton.enabled = YES;
    //self.myButton2.enabled = YES;
    //self.myButton3.enabled = YES;
    //self.myButton4.enabled = YES;
    
    [self setButtonEnabled : YES];
    
}

- (void)setButtonEnabled:(BOOL)val {
    
    for (int i=0; i<self.opButtons.count; i++)
    {
        UIButton *btn = [self.opButtons objectAtIndex:i];
        btn.enabled = val;
    }
}

- (void)processDigit:(int)digit {
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    display.text = displayString;
    
    /*
    if (firstOperand == NO)
    {
        self.myButton.enabled = NO;
        self.myButton2.enabled = NO;
        self.myButton3.enabled = NO;
        self.myButton4.enabled = NO;
    
        NSLog(@"firstOperand is true....");
    }
    */
    //if (firstOperand == NO)
    //{
    //    [self setButtonEnabled : NO];
    //}
}

- (IBAction)clickDigit:(UIButton *)sender {
    int digit = (int)sender.tag;
    [self processDigit:digit];
}

- (void)processOp:(char)theOp {
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
 
        case '-':
            opStr = @" - ";
            break;
            
        case '*':
            opStr = @" * ";
            break;
 
        case '/':
            opStr = @" / ";
            break;
        
        default:
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString:opStr];
    display.text = displayString;
    
    [self setButtonEnabled : NO];
}

- (void)storeFracPart {
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
        
    } else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    } else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
    
}


- (IBAction)clickOver:(id)sender{
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickPlus:(id)sender {
    [self processOp:  '+'];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp:  '-'];
}

- (IBAction)clickMultiply:(id)sender {
    [self processOp:  '*'];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp:  '/'];
}


- (IBAction)clickEquals:(id)sender {
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
        
        /*
        self.myButton.enabled = YES;
        self.myButton2.enabled = YES;
        self.myButton3.enabled = YES;
        self.myButton4.enabled = YES;
         */
        [self setButtonEnabled : YES];
    }
}

- (IBAction)clickClear:(id)sender {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
    /*
    self.myButton.enabled = YES;
    self.myButton2.enabled = YES;
    self.myButton3.enabled = YES;
    self.myButton4.enabled = YES;
     */
    [self setButtonEnabled : YES];
}

- (IBAction)openInfoView:(id)sender {
//    infoview
    InfoViewController *infoViewcontroller = [self.storyboard instantiateViewControllerWithIdentifier:@"infoview"];
    
    infoViewcontroller.delegate = self;
    
    infoViewcontroller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    infoViewcontroller.myString = self.display.text;
    
    [self presentViewController : infoViewcontroller animated:YES completion:nil];
    
}

- (IBAction)openNewView:(id)sender {
    [self performSegueWithIdentifier:@"blueview" sender:self];
}

- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender {
    NSLog(@"unwindToViewController");
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"Seque ID = %@", segue.identifier);
    
    if ([segue.identifier isEqualToString:@"blueview"]){
        InfoViewController *infoView = [segue destinationViewController];
        infoView.myString = @"Hello World";
    }
    
}

- (IBAction)changeColor:(UIColor *)newColor {
    NSLog(@"Change Color");
    
    [self.view setBackgroundColor:newColor];
}

@end

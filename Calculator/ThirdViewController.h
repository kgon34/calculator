//
//  ThirdViewController.h
//  Calculator
//
//  Created by MF839-011 on 2016. 6. 17..
//  Copyright © 2016년 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController {
    void(^changeMainBackColor)(UIColor*);
}

- (IBAction)changeColor:(id)sender;

- (void)changeColorFunc:(void(^)(UIColor*))myFunc;

@end

//
//  ViewController.h
//  addingbook
//
//  Created by BSA Univ15 on 27/01/14.
//  Copyright (c) 2014 BSA Univ15. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIDatePicker *datePick;
    IBOutlet UILabel *datelabel;
}
@property (weak, nonatomic) IBOutlet UITextField *bookTitleTextfield;
@property (weak, nonatomic) IBOutlet UITextField *authorTextfield;
@property (atomic, retain) IBOutlet UILabel *datelabel;
@property (retain, nonatomic) IBOutlet UITextField *totalPageTextfield;
@property (weak, nonatomic) IBOutlet UITextField *getText;
@property (retain, atomic) IBOutlet UIDatePicker *datePick;
@property (weak, nonatomic) IBOutlet UIView *pickview;
@property (weak, nonatomic) IBOutlet UILabel *mandatoryDisplay1;
@property (weak, nonatomic) IBOutlet UILabel *mandatoryDisplay2;
@property (weak, nonatomic) IBOutlet UILabel *mandatoryDisplay4;
@property (weak, nonatomic) IBOutlet UILabel *mandatoryDisplay5;
- (IBAction)startDate:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)hide:(id)sender;


- (IBAction)addbookAction:(id)sender;
@end

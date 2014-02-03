//
//  ViewController.m
//  addingbook
//
//  Created by BSA Univ15 on 27/01/14.
//  Copyright (c) 2014 BSA Univ15. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
{
    NSManagedObjectContext *context;
}
@end

@implementation ViewController
@synthesize bookTitleTextfield,authorTextfield,totalPageTextfield,datePick,pickview,mandatoryDisplay1,mandatoryDisplay2,mandatoryDisplay4,datelabel,getText,mandatoryDisplay5;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[self bookTitleTextfield]setDelegate:self];
    [[self authorTextfield]setDelegate:self];
    [[self totalPageTextfield]setDelegate:self];
    [[self getText]setDelegate:self];
    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
    context=[appdelegate managedObjectContext];
    pickview.frame=CGRectMake(0, 396, 320, 172);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startDate:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.6];
    pickview.frame=CGRectMake(0,366,320,172);
    [UIView commitAnimations];

    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateStyle = NSDateFormatterMediumStyle;
    datelabel.text=[NSString stringWithFormat:@"%@",[df stringFromDate:[NSDate date]]];
    datePick.datePickerMode=UIDatePickerModeDate;
    datePick.date=[NSDate date];
    [datePick addTarget:self action:@selector(labelChange:) forControlEvents:UIControlEventValueChanged];
    
    //[self.view addSubview:datePick];
    //[self.view addSubview:datelabel];
 
 
}

- (IBAction)done:(id)sender
{
    NSDateFormatter *ef=[[NSDateFormatter alloc]init];
    ef.dateStyle=NSDateFormatterMediumStyle;
    datePick.datePickerMode=UIDatePickerModeDate;
    [datePick addTarget:self action:@selector(labelChange:) forControlEvents:UIControlEventValueChanged];
    datelabel.text=[NSString stringWithFormat:@"%@",[ef stringFromDate:[NSDate date]]];
}

- (IBAction)hide:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    pickview.frame=CGRectMake(0,596, 320, 172);
    [UIView commitAnimations];
    
}

- (IBAction)addbookAction:(id)sender
{
    NSEntityDescription *entitydesc=[NSEntityDescription entityForName:@"Addbook" inManagedObjectContext:context];
    NSManagedObject *newBook = [[NSManagedObject alloc]initWithEntity:entitydesc insertIntoManagedObjectContext:context];
    NSString *ttlpage=totalPageTextfield.text;
    NSNumber *totalpages=[NSNumber numberWithInt:[ttlpage intValue]];
    if (bookTitleTextfield.text.length>0)
    {
        [newBook setValue:self.bookTitleTextfield.text forKey:@"booktitle"];
        mandatoryDisplay1.text=@"";
    }
    else{
            mandatoryDisplay1.text=@"*";
    }
    if(authorTextfield.text.length>0)
    {
        [newBook setValue:self.authorTextfield.text forKey:@"author"];
        mandatoryDisplay2.text=@"";
    }
    else
    {
        mandatoryDisplay2.text=@"*";
    }
    if(totalPageTextfield.text.length>0)
    {
        [newBook setValue:totalpages forKey:@"totalpage"];
        mandatoryDisplay4.text=@"";
    }
    else
    {
      mandatoryDisplay4.text=@"*";
    }
    if (getText.text.length>0) {
        [newBook setValue:self.getText.text forKey:@"date"];
        mandatoryDisplay5.text=@"";
    }
    else
    {
        mandatoryDisplay5.text=@"*";
    }
    NSDateFormatter *df=[[NSDateFormatter alloc]init];
    df.dateStyle=NSDateFormatterMediumStyle;
    
   NSString *choice=[NSString stringWithFormat:@"%@",[df stringFromDate:[NSDate date]]];
    NSString *choice1=bookTitleTextfield.text;
    NSString *choice2=authorTextfield.text;
    NSString *words =[[NSString alloc]initWithFormat:@"\nBook Name: %@\n Author Name:%@\n Starting Date:%@",choice1,choice2,choice];
    NSString *words1=[[NSString alloc]initWithFormat:@"Fill the Empty Fields"];
    if (bookTitleTextfield.text.length>0&&authorTextfield.text.length>0&&totalPageTextfield.text.length>0) {
        
    UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Book Added" message:words delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
        NSError *error;
        [context save:&error];
    }
    else{
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Fields Missing" message:words1 delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];

    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
    
}

-(void)labelChange:(id)sender{
    NSDateFormatter *df=[[NSDateFormatter alloc]init];
    df.dateStyle=NSDateFormatterMediumStyle;
    datelabel.text=[NSString stringWithFormat:@"%@",[df stringFromDate:datePick.date]];
    getText.text=datelabel.text;
}
@end

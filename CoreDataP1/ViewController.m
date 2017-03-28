//
//  ViewController.m
//  CoreDataP1
//
//  Created by Pierre Binon on 2017-03-27.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//
//Part I: https://www.youtube.com/watch?v=EGO9XBFrZE0
//Part II: https://www.youtube.com/watch?v=p_INW9noMDI


#import "ViewController.h"
#import "Students+CoreDataProperties.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *studentIDTextField;
@property (weak, nonatomic) IBOutlet UITextView *outputTextView;

@end





@implementation ViewController

- (IBAction)addToDatabase:(UIButton *)sender {
    
    NSDictionary *studentInfo = @{@"name" : self.nameTextField.text,
                                  @"lastName" : self.lastnameTextField.text,
                                  @"studentID" : self.studentIDTextField.text};
    
    //The .description below makes every element in the array a NSString
    self.outputTextView.text = [Students addStudentInfoFromDictionary: studentInfo].description;
}


- (IBAction)searchDatabase:(UIButton *)sender {
    
    self.outputTextView.text = [Students searchStudentsByName: self.nameTextField.text lastName: self.lastnameTextField.text].description;
}

@end

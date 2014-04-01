//
//  ViewController.h
//  Resistor
//
//  Created by Dylan Bourgeois on 01/04/14.
//  Copyright (c) 2014 Dylan Bourgeois. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@property (strong, nonatomic) IBOutlet UILabel *resistorValue;

@property (strong, nonatomic)          NSArray *colorArray;

@property (strong, nonatomic)          NSArray *tempArray;
@property (strong, nonatomic)          NSArray *segTempArray;

@property (strong, nonatomic)          NSArray *tolArray;
@property (strong, nonatomic)          NSArray *segTolArray;
@property (strong, nonatomic)          NSString *tolString;


@property (strong, nonatomic)          NSArray *multiplierArray;

@property (strong, nonatomic)          NSArray *segArray;
@property (strong, nonatomic)          NSArray *segMultArray;

@property (strong, nonatomic) IBOutlet UILabel *toleranceLabel;
@property (strong, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (strong, nonatomic)          NSString *temperatureString;

@property (strong, nonatomic) IBOutlet UILabel *nbBandes;
@property (strong, nonatomic) IBOutlet UIStepper *bandeStepper;


@property (strong, nonatomic) IBOutlet UIImageView *seg1;
@property (strong, nonatomic) IBOutlet UIImageView *seg2;
@property (strong, nonatomic) IBOutlet UIImageView *seg3;
@property (strong, nonatomic) IBOutlet UIImageView *seg4;
@property (strong, nonatomic) IBOutlet UIImageView *seg5;
@property (strong, nonatomic) IBOutlet UIImageView *seg6;

@end

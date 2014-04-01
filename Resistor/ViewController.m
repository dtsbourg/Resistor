//
//  ViewController.m
//  Resistor
//
//  Created by Dylan Bourgeois on 01/04/14.
//  Copyright (c) 2014 Dylan Bourgeois. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int firstDigit;
    int secondDigit;
    int thirdDigit;
    float multiplier;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.colorArray  = [[NSArray alloc]initWithObjects:@"Noir",@"Marron",@"Rouge",@"Orange",@"Jaune",
                        @"Vert",@"Bleu",@"Violet",@"Gris",@"Blanc", nil];
    self.segArray = [[NSArray alloc]initWithObjects:@"black.png", @"brown.png",@"red.png",@"orange.png",@"yellow.png",
                     @"green.png",@"blue.png",@"purple.png",@"grey.png",@"white.png", nil];
    
    
    
    self.multiplierArray = [[NSArray alloc]initWithObjects:@"Argenté",@"Doré",@"Noir",@"Marron",@"Rouge",@"Orange",@"Jaune",
                        @"Vert",@"Bleu",@"Violet", nil];
    self.segMultArray = [[NSArray alloc]initWithObjects:@"silver.png",@"gold.jpeg",@"black.png", @"brown.png",@"red.png",@"orange.png",@"yellow.png",@"green.png",@"blue.png",@"purple.png", nil];
    
    
    self.tolArray = [[NSArray alloc]initWithObjects:@"Argenté",@"Doré",@"Marron",@"Rouge",@"Orange",@"Jaune",
                            @"Vert",@"Bleu",@"Violet", nil];
    self.segTolArray = [[NSArray alloc]initWithObjects:@"silver.png",@"gold.jpeg",@"brown.png",@"red.png", @"orange.png",@"yellow.png",@"green.png",@"blue.png",@"purple.png", nil];
    
    
    self.tempArray = [[NSArray alloc]initWithObjects:@"Marron",@"Rouge",@"Orange",@"Jaune", nil];
    self.segTempArray = [[NSArray alloc]initWithObjects:@"brown.png",@"red.png", @"orange.png",@"yellow.png", nil];
    
    
    
    [self.picker selectRow:2 inComponent:3 animated:NO];
    
    firstDigit = 0; secondDigit = 0; thirdDigit = 0; multiplier = 1; self.temperatureString = @"100 ppm";
    self.tolString = @"± 10%";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if ([self.nbBandes.text isEqualToString:@"4"]) {
        self.seg6.hidden = YES;
        self.seg4.hidden = YES;
        return 4;
    }
    
    else if ([self.nbBandes.text isEqualToString:@"5"]) {
        self.seg6.hidden = YES;
        self.seg4.hidden = NO;
        return 5;
    }
    
    else if ([self.nbBandes.text isEqualToString:@"6"]) {
        self.seg6.hidden = NO;
        self.seg4.hidden = NO;
        return 6;
    }
    
    else return 6;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return 10;
            break;
        case 1:
            return 10;
            break;
        case 2:
            return 10;
            break;
        case 3:
            return 10;
            break;
        case 4:
            return 7;
            break;
        case 5:
            return 4;
            break;
        default:
            return 0;
            break;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [self.colorArray objectAtIndex:row];
            break;
        case 1:
            return [self.colorArray objectAtIndex:row];
            break;
        case 2:
            if ([self.nbBandes.text isEqualToString:@"4"])
            {
                return [self.multiplierArray objectAtIndex:row];
            }
            else
            return [self.colorArray objectAtIndex:row];
            break;
        case 3:
            return [self.multiplierArray objectAtIndex:row];
            break;
        case 4:
            return [self.tolArray objectAtIndex:row];
            break;
        case 5:
            return [self.tempArray objectAtIndex:row];
            break;
        default:
            return 0;
            break;
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            self.seg1.image=[UIImage imageNamed:[self.segArray objectAtIndex:row]];
            firstDigit = row;
            break;
        
        case 1:
            self.seg2.image=[UIImage imageNamed:[self.segArray objectAtIndex:row]];
            secondDigit = row;
            break;
            
        case 2:
            if ([self.nbBandes.text isEqualToString:@"4"])
            {
                self.seg4.image=[UIImage imageNamed:[self.segMultArray objectAtIndex:row]];
                switch(row)
                {
                    case 0:
                        multiplier = 0.01;
                        break;
                    case 1:
                        multiplier = 0.1;
                        break;
                    case 2:
                        multiplier = 1;
                        break;
                    case 3:
                        multiplier = 10;
                        break;
                    case 4:
                        multiplier = 100;
                        break;
                    case 5:
                        multiplier = 1000;
                        break;
                    case 6:
                        multiplier = 10000;
                        break;
                    case 7:
                        multiplier = 100000;
                        break;
                    case 8:
                        multiplier = 1000000;
                        break;
                    case 9:
                        multiplier = 10000000;
                        break;
                }
            }
            else
            {
                self.seg3.image=[UIImage imageNamed:[self.segArray objectAtIndex:row]];
                thirdDigit = row;
            }
            
            break;
            
        case 3:
            self.seg4.image=[UIImage imageNamed:[self.segMultArray objectAtIndex:row]];
            switch(row)
            {
                case 0:
                    multiplier = 0.01;
                    break;
                case 1:
                    multiplier = 0.1;
                    break;
                case 2:
                    multiplier = 1;
                    break;
                case 3:
                    multiplier = 10;
                    break;
                case 4:
                    multiplier = 100;
                    break;
                case 5:
                    multiplier = 1000;
                    break;
                case 6:
                    multiplier = 10000;
                    break;
                case 7:
                    multiplier = 100000;
                    break;
                case 8:
                    multiplier = 1000000;
                    break;
                case 9:
                    multiplier = 10000000;
                    break;
            }
            break;
            
        case 4:
            self.seg5.image=[UIImage imageNamed:[self.segTolArray objectAtIndex:row]];
            switch(row)
            {
                case 0:
                    self.tolString = @"± 10%";
                    break;
                case 1:
                    self.tolString = @"± 5%";
                    break;
                case 2:
                    self.tolString = @"± 1%";
                    break;
                case 3:
                    self.tolString = @"± 2%";
                    break;
                case 4:
                    self.tolString = @"± 0.5%";
                    break;
                case 5:
                    self.tolString = @"± 0.25%";
                    break;
                case 6:
                    self.tolString = @"± 0.1%";
                    break;
            }

            break;
        case 5:
            self.seg6.image=[UIImage imageNamed:[self.segTempArray objectAtIndex:row]];
            switch(row)
            {
                case 0:
                    self.temperatureString = @"100 ppm";
                    break;
                case 1:
                    self.temperatureString = @"50 ppm";
                    break;
                case 2:
                    self.temperatureString = @"15 ppm";
                    break;
                case 3:
                    self.temperatureString = @"25 ppm";
                    break;
            }
            break;

        default:
            break;
    }
    
    if (((firstDigit+secondDigit*10+thirdDigit*100)*multiplier) < 100)
    self.resistorValue.text = [NSString stringWithFormat:@"%.0f Ω", ((firstDigit+secondDigit*10+thirdDigit*100)*multiplier)];
    else if (((firstDigit+secondDigit*10+thirdDigit*100)*multiplier) < 1000)
    self.resistorValue.text = [NSString stringWithFormat:@"%.0f Ω", ((firstDigit+secondDigit*10+thirdDigit*100)*multiplier)];
    else if (((firstDigit+secondDigit*10+thirdDigit*100)*multiplier) < 1000000)
    self.resistorValue.text = [NSString stringWithFormat:@"%.2f kΩ", ((firstDigit+secondDigit*10+thirdDigit*100)*multiplier)/1000];
    else if (((firstDigit+secondDigit*10+thirdDigit*100)*multiplier) < 1000000000)
    self.resistorValue.text = [NSString stringWithFormat:@"%.2f GΩ", ((firstDigit+secondDigit*10+thirdDigit*100)*multiplier)/1000000];
    
    self.temperatureLabel.text = [NSString stringWithFormat:@"température : %@", self.temperatureString];
    self.toleranceLabel.text = [NSString stringWithFormat:@"Tolérance : %@", self.tolString];
    
}

- (IBAction)valueChanged:(UIStepper *)sender {
    
    sender.minimumValue = 4; sender.maximumValue = 6;
    
    double value = [sender value];
    [self.nbBandes setText:[NSString stringWithFormat:@"%d", (int)value]];
    
    [self.picker reloadAllComponents];
}

@end

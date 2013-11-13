//
//  PPViewController.m
//  PatricksPlayground
//
//  Created by Patrick Albrecht Magen on 27.06.13.
//  Copyright (c) 2013 Bytolution. All rights reserved.
//

#import "PPViewController.h"

@interface PPViewController ()

- (void)buttonPressed:(UIButton*)sender;
- (void)sliderValueChanged:(UISlider*)sender;
- (void)sliderBrightnessValueChanged:(UISlider *)sender;
 
@property (nonatomic, copy) NSString *Label;
@property (nonatomic) float *value;

@property (strong, nonatomic) UISlider *sliderRed;
@property (strong, nonatomic) UISlider *sliderGreen;
@property (strong, nonatomic) UISlider *sliderBlue;
@property (strong, nonatomic) UISlider *sliderBrightness;

@property (strong, nonatomic) UIColor *sliderLabelTextColor;
@property (strong, nonatomic) UILabel *sliderLabelRGBColor;
@end

@implementation PPViewController

- (void)viewDidAppear:(BOOL)animated
{
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    CGRect rectForButton1 = CGRectMake(75, 400, 170, 40);
    
    [button1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    
    button1.frame = rectForButton1;
    
    [button1 setTitle:@"RESET" forState:UIControlStateNormal];

    
    button1.titleLabel.font = [UIFont fontWithName:@"TrebuchetMS" size:28];
    
    [self.view addSubview:button1];
    
    
    self.sliderRed = [[UISlider alloc] init];
    self.sliderGreen = [[UISlider alloc] init];
    self.sliderBlue = [[UISlider alloc] init];
    self.sliderBrightness = [[UISlider alloc] init];
    
    UILabel *sliderLabelRed = [[UILabel alloc] init];
    UILabel *sliderLabelGreen = [[UILabel alloc] init];
    UILabel *sliderLabelBlue = [[UILabel alloc] init];
    UILabel *sliderLabelBrightness = [[UILabel alloc] init];
    UILabel *sliderLabelRGBColor = [[UILabel alloc] init];
    
    CGRect rectForSliderRed = CGRectMake(15,  25, 230, 40);
    CGRect rectForSliderGreen = CGRectMake(15, 70, 230, 40);
    CGRect rectForSliderBlue = CGRectMake(15, 115, 230, 40);
    CGRect rectForSliderBrightness = CGRectMake(15, 200, 230, 40);
    
    CGRect rectForsliderLabelRed = CGRectMake(250, 25, 60, 40);
    CGRect rectForsliderLabelGreen = CGRectMake(250, 70, 60, 40);
    CGRect rectForsliderLabelBlue = CGRectMake(250, 115, 60, 40);
    CGRect rectForsliderLabelRGBColor = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 300, 100, 100);
    CGRect rectForsliderLabelBrightness = CGRectMake(250, 200, 60, 40);
    
    
    
    [self.sliderRed addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderGreen addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderBlue addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderBrightness addTarget:self action:@selector(sliderBrightnessValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.sliderRed.frame = rectForSliderRed;
    self.sliderGreen.frame = rectForSliderGreen;
    self.sliderBlue.frame = rectForSliderBlue;
    self.sliderBrightness.frame = rectForSliderBrightness;
    
    sliderLabelRed.frame = rectForsliderLabelRed;
    sliderLabelGreen.frame = rectForsliderLabelGreen;
    sliderLabelBlue.frame = rectForsliderLabelBlue;
    sliderLabelBrightness.frame = rectForsliderLabelBrightness;
    sliderLabelRGBColor.frame = rectForsliderLabelRGBColor;

    [sliderLabelRed setText:@"Red"];
    [sliderLabelGreen setText:@"Green"];
    [sliderLabelBlue setText:@"Blue"];
    [sliderLabelBrightness setText:@"Brightness"];
    [sliderLabelRGBColor setText:@"Brightness"];
    
    [sliderLabelRed setBackgroundColor:[UIColor clearColor]];
    [sliderLabelGreen setBackgroundColor:[UIColor clearColor]];
    [sliderLabelBlue setBackgroundColor:[UIColor clearColor]];
    [sliderLabelRGBColor setBackgroundColor:[UIColor clearColor]];
    [sliderLabelBrightness setBackgroundColor:[UIColor clearColor]];
    
    //self.sliderLabelTextColor = [UIColor whiteColor];
    

    sliderLabelRed.font = [UIFont fontWithName:@"TrebuchetMS" size:22];
    sliderLabelGreen.font = [UIFont fontWithName:@"TrebuchetMS" size:22];
    sliderLabelBlue.font = [UIFont fontWithName:@"TrebuchetMS" size:22];
    sliderLabelBrightness.font = [UIFont fontWithName:@"TrebuchetMS" size:12];

    [self.view addSubview:self.sliderRed];
    [self.view addSubview:self.sliderGreen];
    [self.view addSubview:self.sliderBlue];
    [self.view addSubview:self.sliderBrightness];
    
    [self.view addSubview:sliderLabelRed];
    [self.view addSubview:sliderLabelGreen];
    [self.view addSubview:sliderLabelBlue];
    [self.view addSubview:sliderLabelBrightness];
    [self.view addSubview:sliderLabelRGBColor];
    
    
    self.sliderRed.value = 0.5;
    self.sliderGreen.value = 0.5;
    self.sliderBlue.value = 0.5;
    
    self.view.backgroundColor =  [UIColor colorWithRed:self.sliderRed.value green:self.sliderGreen.value blue:self.sliderBlue.value alpha:1];

}

-(void)buttonPressed:(UIButton *)sender
{
    NSLog(@"reset");
    
    self.sliderRed.value = 0.5;
    self.sliderGreen.value = 0.5;
    self.sliderBlue.value = 0.5;
    self.view.backgroundColor = [UIColor colorWithRed:self.sliderRed.value green:self.sliderGreen.value blue:self.sliderBlue.value alpha:1];
    
}

- (void)sliderValueChanged:(UISlider *)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    self.view.backgroundColor = [UIColor colorWithRed:self.sliderRed.value green:self.sliderGreen.value blue:self.sliderBlue.value alpha:1];
    _sliderLabelRGBColor setText:@"test";«
}

- (void)sliderBrightnessValueChanged:(UISlider *)sender
{
    
    [[UIScreen mainScreen] setBrightness:self.sliderBrightness.value];
}
@end

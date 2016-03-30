//
//  ViewController.m
//  DatePicker
//
//  Created by 杨 on 16/1/20.
//  Copyright (c) 2016年 杨. All rights reserved.
//

#import "ViewController.h"
#import "MODatePickerView.h"

@interface ViewController () <MODatePickerViewDelegate>
@property (nonatomic, strong) MODatePickerView *datePicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MODatePickerView *datePicker = [[MODatePickerView alloc] init];
    datePicker.delegate = self;
    [self.view addSubview:datePicker];
    
    _datePicker = datePicker;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showOrHidden:(id)sender {
    if (_datePicker.isPickerHidden) {
        [_datePicker showDatePicker];
    } else {
        [_datePicker hideDatePicker];
    }
}

- (void)confirmDateOfMODatePickerView:(UIDatePicker *)datePicker curDate:(NSDate *)curDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZ"];
    NSString *dateStr = [formatter stringFromDate:curDate];
    NSLog(@"%@",dateStr);
}

@end

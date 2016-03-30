//
//  MODatePickerView.m
//  Cherry
//
//  Created by 杨 on 15/7/7.
//  Copyright (c) 2015年 conquer. All rights reserved.
//

#import "MODatePickerView.h"

@interface MODatePickerView ()
{
    UIDatePicker *_datePicker;
}
@end

@implementation MODatePickerView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 260);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _isPickerHidden = YES;
        [self initUI];
        
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark -
- (void)showDatePicker {
    _isPickerHidden = NO;
    [UIView animateWithDuration:0.3 animations:^(void){
        self.transform = CGAffineTransformMakeTranslation(0, -CGRectGetHeight(self.frame));
    }];
}


- (void)hideDatePicker {
    _isPickerHidden = YES;
    [UIView animateWithDuration:0.3 animations:^(void){
        self.transform = CGAffineTransformIdentity;
    }];
}

#pragma mark -
- (void)setDatePickerWithMaxDate:(NSDate *)maxDate andMinDate:(NSDate *)minDate andCurDate:(NSDate *)curDate
{
    [_datePicker setMaximumDate:maxDate];
    [_datePicker setMinimumDate:minDate];
    [_datePicker setDate:curDate animated:YES];
}

#pragma mark - action
- (void)confirmDateBtnClick {
    
    if (_delegate && [_delegate respondsToSelector:@selector(confirmDateOfMODatePickerView:curDate:)]) {
        [_delegate confirmDateOfMODatePickerView:_datePicker curDate:_datePicker.date];
    }
    
    [self hideDatePicker];
}

- (void)cancelDateBtnClick {
    [self hideDatePicker];
}

#pragma mark - UI
- (void)initUI {
    
    [self addSubview:[self createToolBar]];
    
    //创建datePicker
    _datePicker = [self createDatePicker];
    [self addSubview:_datePicker];
}

#pragma mark - getter
- (NSDate *)date
{
    return _datePicker.date;
}

- (UIDatePicker *)createDatePicker
{
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    //设置显示模式
    datePicker.minuteInterval = 1;
    
    CGRect dateFrame = datePicker.frame;
    dateFrame.origin.y = 44;
    dateFrame.size.width = CGRectGetWidth(self.frame);
    datePicker.frame = dateFrame;
    //设置时间
    return datePicker;
}

- (UIToolbar *)createToolBar {
    //创建工具栏
    NSMutableArray* myToolBarItems = [[NSMutableArray alloc]initWithCapacity:3];
    UIBarButtonItem* confirmBtn = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(confirmDateBtnClick)];
    UIBarButtonItem* flexibleSpaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* cancelBtn = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelDateBtnClick)];
    [myToolBarItems addObject:cancelBtn];
    [myToolBarItems addObject:flexibleSpaceItem];
    [myToolBarItems addObject:confirmBtn];
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
    toolBar.backgroundColor = [UIColor lightTextColor];
    toolBar.items = myToolBarItems;
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    [self addSubview:toolBar];
    
    return toolBar;
}

@end

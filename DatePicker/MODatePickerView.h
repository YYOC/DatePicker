//
//  MODatePickerView.h
//  Cherry
//
//  Created by 杨 on 15/7/7.
//  Copyright (c) 2015年 conquer. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MODatePickerViewDelegate;

@interface MODatePickerView : UIView

@property (nonatomic, weak) id<MODatePickerViewDelegate> delegate;

@property (nonatomic, assign, readonly) BOOL isPickerHidden;

/**
 *  设置DatePicker的maxDate和minDate
 */
- (void)setDatePickerWithMaxDate:(NSDate *)maxDate andMinDate:(NSDate *)minDate andCurDate:(NSDate *)curDate;

/**
 *  获取datePicker上的时间
 */
- (NSDate *)date;

- (void)showDatePicker;
- (void)hideDatePicker;

@end


@protocol MODatePickerViewDelegate <NSObject>

- (void)confirmDateOfMODatePickerView:(UIDatePicker *)datePicker curDate:(NSDate *)curDate;

@end
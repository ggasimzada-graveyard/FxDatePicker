//
//  FxDatePicker.swift
//  Goals
//
//  Created by Gasim on 1/14/15.
//  Copyright (c) 2015 Gasimzada.Net. All rights reserved.
//

import UIKit

protocol FxDatePickerDelegate {
    
    func dateSelected(datePicker: FxDatePicker!, date : NSDate!);
    
}

class FxDatePicker: UIView, UIPickerViewDelegate, UIPickerViewDataSource, FxDatePickerDelegate {
    
    private var pickerView : UIPickerView = UIPickerView();
    private var calendar : NSCalendar = NSCalendar(identifier: NSGregorianCalendar)!;
    private var components : [[String]] = [];
    private var types : [String] = [];
    
    private var yearComponent : Int = -1;
    private var monthComponent : Int = -1;
    private var dayComponent : Int = -1;
    
    var delegate : FxDatePickerDelegate!;
    
    var bgColor : UIColor! = nil;
    var font : UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize());
    var textColor : UIColor = UIColor.blackColor();
    
    func createComponents() {
        var currentDate = calendar.components(NSCalendarUnit(UInt.max), fromDate: NSDate());

        components = [populateMonths(), populateDays(), populateYears()];
        monthComponent = 0;
        dayComponent = 1;
        yearComponent = 2;
        pickerView.reloadAllComponents();
        setCurrent([currentDate.month-1, currentDate.day-1, currentDate.year-1]);
    }
    
    func initialize() {
        pickerView.delegate = self;
        self.delegate = self;
        pickerView.dataSource = self;
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        initialize();
    }
    
    override init() {
        super.init();
        initialize();
        self.frame = CGRect(x: 0, y: 0, width: 420, height: 216);
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        initialize();
        self.frame = CGRect(x: 0, y: 0, width: 420, height: 216);
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect);
        self.addSubview(pickerView);
        if self.bgColor != nil {
            self.backgroundColor = self.bgColor;
        }
        pickerView.backgroundColor = self.backgroundColor;
        createComponents();
    }
    
    func setCurrent(values : [Int]) {
        for var i = 0; i < values.count; ++i {
            pickerView.selectRow(values[i], inComponent: i, animated: false)
        }
    }

    func populateDays() -> [String] {
        var days : [String] = [];
        for var i = 1; i <= 31; ++i {
            days.append("\(i)");
        }
        return days;
    }
    
    func populateMonths() -> [String] {
        return NSDateFormatter().monthSymbols as [String];
    }
    
    func populateYears() -> [String] {
        var years : [String] = [];
        for var i = 1; i <= 9999; ++i {
            years.append("\(i)");
        }
        return years;
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return self.components.count;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.components[component].count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return self.components[component][row];
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        var attributes : [String : AnyObject!] = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: textColor
        ];
        
        return NSAttributedString(string: self.components[component][row], attributes: attributes);
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var selected = NSDateComponents();
        var date : NSDate! = nil;
        if self.yearComponent != -1 {
            selected.year = pickerView.selectedRowInComponent(self.yearComponent) + 1;
        }
        if self.monthComponent != -1 {
            selected.month = pickerView.selectedRowInComponent(self.monthComponent) + 1;
        }
        if self.dayComponent != -1 {
            selected.day = pickerView.selectedRowInComponent(self.dayComponent) + 1;
            if selected.isValidDateInCalendar(calendar) {
                date = calendar.dateFromComponents(selected);
            } else {
                var correct = NSDateComponents();
                correct.month = selected.month + 1;
                correct.day = 0;
                correct.year = selected.year;
                date = calendar.dateFromComponents(correct);
                var correctDay = calendar.component(NSCalendarUnit.CalendarUnitDay, fromDate: date!);
                pickerView.selectRow(correctDay - 1, inComponent: dayComponent, animated: true);
            }
        } else {
            date = calendar.dateFromComponents(selected);
        }
        
        if date != nil {
            delegate.dateSelected(self, date: date);
        }
    }
    
    func dateSelected(datePicker: FxDatePicker!, date: NSDate!) {
        return;
    }
     
}

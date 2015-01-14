## FxDatePicker

A simple and customizable Date Picker that utilizes UIPickerView. Written in Swift.

## Installation

Add the source file (FxDatePicker.swift) into your project.

## Usage

I tried to make the usage as simple as possible. So, here is how to use it.

### Storyboard

Create a View in the storyboard, go to identity inspector, and change the class name to FxDatePicker. That's it!
	
### TextField InputView

Create FxDatePicker object and assign it to the inputView:

	var datePicker = FxDatePicker();
	textField.inputView = datePicker;
	
### Customizations

At this moment, one can change the text color, background color, and font of the date picker:

	datePicker.textColor = UIColor.whiteColor();
	datePicker.font = UIFont(name: "Oxygen", size: 14.0);
	datePicker.backgroundColor = UIColor.blackColor();
	
When assigning the any view into input view of a text field, the text field overrides the `backgroundColor` property of the view. Therefore, I added a `bgColor` property for this case:

	datePicker.bgColor = UIColor.blackColor();

For now, this date picker only supports dates but I will be adding Time mode and DateAndTime mode very soon.

### Delegate

There is only one function in the delegate for this class `dateSelected`. This event is triggered when a valid date is selected in the picker. The function signature is as the follows:

    func dateSelected(datePicker: FxDatePicker!, date : NSDate!);
    
First argument is the date picker that the event is triggered from; and the second function is the date that is currently active/selected. To use the delegate method, add FxDatePickerDelegate to your class and assign your class to the delegate property:

	class Controller : UIViewController, FxDatePickerDelegate {
	
		override func viewDidLoad() {
			var datePicker = FxDatePicker();
			datePicker.textColor = UIColor.whiteColor();
			datePicker.bgColor = UIColor.blackColor();
			datePicker.font = UIFont(name: "Oxygen", size: 14.0);
			datePicker.delegate = self;
			textField.inputView = datePicker;
		}
		
		func dateSelected(datePicker: FxDatePicker!, date: NSDate!) {
			println(date);
		}
		
	}

## Future Plans (in order)

- Add Time Picker
- More customizations: 12 hour or 24 hour time; selected row font and colors; DatePicker modes
- Add Date and Time Picker together
- Date boundaries

## Author

[Gasim Gasimzada](http://www.gasimzada.net)

## License
FxDatePicker is available under MIT license. See the LICENSE file for more info.


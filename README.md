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

In order to change the default font and the text color change the `font` and `textColor` properties, respectively:

	datePicker.textColor = UIColor.whiteColor();
	datePicker.font = UIFont(name: "HelveticaNeue", size: 14.0);

There is also support for changing font for the selected row. The properties are `selectedFont` and `selectedTextColor`:

	datePicker.selectedTextColor = UIColor.redColor();
	datePicker.selectedFont = UIFont(name: "HelveticaNeue-Bold", 16.0);
	
When assigning the any view into input view of a text field, the text field overrides the `backgroundColor` property of the view. Therefore, I added a `bgColor` property for this case:

	datePicker.bgColor = UIColor.blackColor();

For changing picker mode from date to time, change the mode property to Time:

	datePicker.mode = FxDatePickerMode.Time

Available Enumerations (more coming soon):
	
	FxDatePickerMode {
		case Date
		case Time
	}
	
The AM/PM part of the date picker is based on the locale property of the date picker. If you need to force the locale, change the locale property like below:

	datePicker.locale = NSLocale(localeIdentifer: "en_US_POSIX");
	
*The locale is very partially supported in this version but over time I will adapt localization more and more until the date picker fully supports it.*

### Delegate

There is only one function in the delegate for this class `dateSelected`. This event is triggered when a valid date is selected in the picker. The function signature is as the follows:

    func dateSelected(datePicker: FxDatePicker!, date : NSDate!);
    
First argument is the date picker that the event is triggered from; and the second function is the date that is currently active/selected. To use the delegate method, add FxDatePickerDelegate to your class and assign your class to the delegate property:

	class Controller : UIViewController, FxDatePickerDelegate {
	
		override func viewDidLoad() {
			var datePicker = FxDatePicker();
			datePicker.bgColor = UIColor.blackColor();

			datePicker.font = UIFont(name: "HelveticaNeue", size: 14.0);
			datePicker.textColor = UIColor.whiteColor();
			datePicker.selectedTextColor = UIColor.redColor();
			datePicker.selectedFont = UIFont(name: "HelveticaNeue-Bold", 16.0);

			datePicker.delegate = self;

			textField.inputView = datePicker;
		}
		
		func dateSelected(datePicker: FxDatePicker!, date: NSDate!) {
			print(date);
		}
		
	}
	
## UPDATE

 - [01/19] Lots of design changes - Rewrote the codebase to be more clean, robust, and modular. Added Time Picker. For future releases I will be adopting localization more and more; eventually the library will have a full localization support.
 - [10/30] Code refactored to work with Swift 2.0. Added customizations for selected row and font colors.

## Future Plans (in order)

- ~~Add Time Picker~~
- ~~More customizations: Selected row font and colors~~
- Add Date and Time Picker together
- Date boundaries

## Author

[Gasim Gasimzada](http://www.gasimzada.me)

## License
FxDatePicker is available under MIT license. See the LICENSE file for more info.


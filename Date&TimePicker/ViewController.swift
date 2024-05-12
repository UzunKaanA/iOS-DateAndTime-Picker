//
//  ViewController.swift
//  Date&TimePicker
//
//  Created by Kaan Uzun on 12.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfClock: UITextField!
    @IBOutlet weak var tfDate: UITextField!
    
    
    var datePicker:UIDatePicker?
    var timePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfDate.inputView = datePicker
    
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        tfClock.inputView = timePicker
        
        //Changing the Date & Time style box.
        if #available(iOS 13.4, *){
            datePicker?.preferredDatePickerStyle = .wheels
            timePicker?.preferredDatePickerStyle = .wheels
        }
        
        //adding the action
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gestureDetect))
        view.addGestureRecognizer(gesture)
        
        //adding the changed value to box
        datePicker?.addTarget(self, action: #selector(showDate(uiDatePicker:)), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(showTime(uiDatePicker:)), for: .valueChanged)
   }

    //clearing the screen.
   @objc func gestureDetect(){
        print("Screen Touched!")
        view.endEditing(true)
    }
    
    @objc func showDate(uiDatePicker: UIDatePicker){
        let format = DateFormatter()
        format.dateFormat = "dd.MM.yyyy"
        let res = format.string(from: uiDatePicker.date)
        tfDate.text = res
    }
    
    @objc func showTime(uiDatePicker: UIDatePicker){
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let res = format.string(from: uiDatePicker.date)
        tfClock.text = res
    }
}


//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Елизавета Дубасова on 23.09.2023.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay() {
        
    }
    
    // данный метод определяет, что будет происходить, когда мы будем прикасаться к экрану (точнее к данному ViewController-у)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
}


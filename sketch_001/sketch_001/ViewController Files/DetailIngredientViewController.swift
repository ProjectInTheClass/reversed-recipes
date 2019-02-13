//
//  DetailIngredientViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class DetailIngredientViewController: UIViewController {

    var ingredient: Ingredient?
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var expirationDateLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var frozenSwitch: UISwitch!
    
    @IBAction func handleFrozen(_ sender: Any) {
        if frozenSwitch.isOn {
            // ingredient.frozen = true
            print("frozen on")
        } else {
            // ingredient.frozen = false
            print("frozen off")
        }
    }
    
    let dateFormatter = DateFormatter()
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func handleDateChanged() {
        let calendar = Calendar(identifier: .gregorian)
        let startDateStr = dateFormatter.string(from: datePicker.date)
        let endDate = calendar.date(byAdding: DateComponents(day: 5), to: datePicker.date)
        let endDateStr = dateFormatter.string(from: endDate!)
        startDateLabel.text = startDateStr
        endDateLabel.text = endDateStr
        
        let todayDate = Date()
        let remainingDate = todayDate.timeIntervalSince(datePicker.date)
        let remainingDays = Int(remainingDate / 86400)
        expirationDateLabel.text = "\(remainingDays) / 5"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleDateChanged()
    }
}

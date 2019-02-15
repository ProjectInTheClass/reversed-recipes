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
    var delegate: ChangeDate?
    var isChangedDate: Bool?
    var isChangedFrozen: Bool?
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var frozenSwitch: UISwitch!
    
    @IBAction func close(_ sender: Any) {
        if isChangedDate! {
            delegate?.changeDate(changedIngre: ingredient!)
        }
        
        if isChangedFrozen! {
            delegate?.changeFrozen(changedIngre: ingredient!)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleFrozen(_ sender: Any) {
        isChangedFrozen = true
        
        if frozenSwitch.isOn {
            // ingredient.frozen = true
            print("frozen on")
            endDateLabel.textColor = UIColor.gray
            ingredient?.isFrozen = true
        } else {
            // ingredient.frozen = false
            print("frozen off")
            endDateLabel.textColor = UIColor.black
            ingredient?.isFrozen = false
        }
    }
    
    let dateFormatter = DateFormatter()
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func handleDateChanged() {
        let calendar = Calendar(identifier: .gregorian)
        let startDateStr = dateFormatter.string(from: datePicker.date)
        let endDate = calendar.date(byAdding: DateComponents(day: ingredient!.expirationDate), to: datePicker.date)
        let endDateStr = dateFormatter.string(from: endDate!)
        startDateLabel.text = startDateStr
        
        if ingredient!.expirationDate != -1 {
            endDateLabel.text = endDateStr
        } else {
            endDateLabel.text = "-"
        }
        
        ingredient?.startDate = startDateStr
        isChangedDate = true
//        let todayDate = Date()
//        let remainingDate = todayDate.timeIntervalSince(datePicker.date)
//        let remainingDays = Int(remainingDate / 86400)
//        expirationDateLabel.text = "\(remainingDays) / 5"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        isChangedDate = false
        isChangedFrozen = false
        
        iconImage.image = UIImage(named: ingredient!.icon)
        nameLabel.text = ingredient!.name
        classLabel.text = ingredient!.´class´
        
        if ingredient!.expirationDate == -1 {
            endDateLabel.text = "-"
        }
        
        if ingredient?.isFrozen == true {
            endDateLabel.textColor = UIColor.gray
            frozenSwitch.isOn = true
        }
        
        if let date = ingredient?.startDate {
            startDateLabel.text = date
            datePicker.date = dateFormatter.date(from: date)!
        } else {
//            startDateLabel.text = dateFormatter.string(from: datePicker.date)
            print("ingredient.startDate error!")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleDateChanged()
    }
}

protocol ChangeDate {
    func changeDate(changedIngre: Ingredient)
    func changeFrozen(changedIngre: Ingredient)
}

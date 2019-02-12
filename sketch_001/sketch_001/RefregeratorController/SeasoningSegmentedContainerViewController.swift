//
//  SeasoningSegmentedContainerViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class SeasoningSegmentedContainerViewController: UIViewController {

    @IBOutlet weak var soySauceButton: UIButton!
    @IBOutlet weak var sugarButton: UIButton!
    @IBOutlet weak var saltButton: UIButton!
    @IBOutlet weak var maltSugarButton: UIButton!
    @IBOutlet weak var redPepperPasteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func soySauceButtonSelected(_ sender: Any) {
        if soySauceButton.isSelected == true {
            soySauceButton.isSelected = false
            soySauceButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesSeasonPre.remove("간장")
        }
        else {
            soySauceButton.isSelected = true
            soySauceButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesSeasonPre.insert("간장")
        }
    }
    
    @IBAction func sugarButtonSelected(_ sender: Any) {
        if sugarButton.isSelected == true {
            sugarButton.isSelected = false
            sugarButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesSeasonPre.remove("설탕")
        }
        else {
            sugarButton.isSelected = true
            sugarButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesSeasonPre.insert("설탕")
        }
    }
    
    @IBAction func saltButtonSelected(_ sender: Any) {
        if saltButton.isSelected == true {
            saltButton.isSelected = false
            saltButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesSeasonPre.remove("소금")
        }
        else {
            saltButton.isSelected = true
            saltButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesSeasonPre.insert("소금")
        }
    }
    
    @IBAction func maltSugarButtonSelected(_ sender: Any) {
        if maltSugarButton.isSelected == true {
            maltSugarButton.isSelected = false
            maltSugarButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesSeasonPre.remove("엿당")
        }
        else {
            maltSugarButton.isSelected = true
            maltSugarButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesSeasonPre.insert("엿당")
        }
    }
    
    @IBAction func redPepperPasteButtonSelected(_ sender: Any) {
        if redPepperPasteButton.isSelected == true {
            redPepperPasteButton.isSelected = false
            redPepperPasteButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesSeasonPre.remove("고추장")
        }
        else {
            redPepperPasteButton.isSelected = true
            redPepperPasteButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesSeasonPre.insert("고추장")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

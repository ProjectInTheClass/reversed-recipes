//
//  MeatViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

protocol SendAddesMeatPreDelegate {
    func sendAddesMeatPre(addesMeatPre: Set<String>)
}

class MeatViewController: UIViewController {

    var delegate: SendAddesMeatPreDelegate?
    
    var addesMeatPre: Set<String> = Set<String>()
    
    @IBOutlet weak var steakButton: UIButton!
    @IBOutlet weak var porkButton: UIButton!
    @IBOutlet weak var chickenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func steakButtonSelected(_ sender: Any) {
        if steakButton.isSelected == true {
            steakButton.isSelected = false
            steakButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesMeatPre.remove("소고기")
        }
        else {
            steakButton.isSelected = true
            steakButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesMeatPre.insert("소고기")
        }
    }
    
    @IBAction func porkButtonSelected(_ sender: Any) {
        if porkButton.isSelected == true {
            porkButton.isSelected = false
            porkButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesMeatPre.remove("돼지고기")
        }
        else {
            porkButton.isSelected = true
            porkButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesMeatPre.insert("돼지고기")
        }
    }
    
    @IBAction func chickenButtonSelected(_ sender: Any) {
        if chickenButton.isSelected == true {
            chickenButton.isSelected = false
            chickenButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesMeatPre.remove("닭고기")
        }
        else {
            chickenButton.isSelected = true
            chickenButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesMeatPre.insert("닭고기")
        }
    }
    
    
    @IBAction func dismissButton(_ sender: Any) {
        delegate?.sendAddesMeatPre(addesMeatPre: addesMeatPre)
    }
}

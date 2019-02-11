//
//  VegitableViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

protocol SendAddesVegitablePreDelegate {
    func sendAddesVegitablePre(addesVegitablePre: Set<String>)
}

class VegitableViewController: UIViewController {

    var delegtae: SendAddesVegitablePreDelegate?
    
    var addesVegitablePre: Set<String> = Set<String>()
    
    
    @IBOutlet weak var carrotButton: UIButton!
    @IBOutlet weak var cucumberButton: UIButton!
    @IBOutlet weak var whiteRadishButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func carrotButtonSelected(_ sender: Any) {
        if carrotButton.isSelected == true {
            carrotButton.isSelected = false
            carrotButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesVegitablePre.remove("당근")
        }
        else {
            carrotButton.isSelected = true
            carrotButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesVegitablePre.insert("당근")
        }
    }
    
    @IBAction func cucumberButtonSelected(_ sender: Any) {
        if cucumberButton.isSelected == true {
            cucumberButton.isSelected = false
            cucumberButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesVegitablePre.remove("오이")
        }
        else {
            cucumberButton.isSelected = true
            cucumberButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesVegitablePre.insert("오이")
        }
    }
    
    @IBAction func whiteRadishButtonSelected(_ sender: Any) {
        if whiteRadishButton.isSelected == true {
            whiteRadishButton.isSelected = false
            whiteRadishButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesVegitablePre.remove("무")
        }
        else {
            whiteRadishButton.isSelected = true
            whiteRadishButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesVegitablePre.insert("무")
        }
    }

    @IBAction func dismissButton(_ sender: Any) {
        delegate?.sendAddesVegitablePre(addesVegitablePre: addesVegitablePre)
    }
    
}

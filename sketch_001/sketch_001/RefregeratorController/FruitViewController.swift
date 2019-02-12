//
//  FruitViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

protocol SendAddesFruitPreDelegate {
    func sendAddesFruitPre(addesFruitPre: Set<String>)
}

class FruitViewController: UIViewController {

    var delegate: SendAddesFruitPreDelegate?
    
    var addesFruitPre: Set<String> = Set<String>()
    
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var pearButton: UIButton!
    @IBOutlet weak var waterMelonButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func appleButtonSelected(_ sender: Any) {
        if appleButton.isSelected == true {
            appleButton.isSelected = false
            appleButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesFruitPre.remove("사과")
        }
        else {
            appleButton.isSelected = true
            appleButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesFruitPre.insert("사과")
        }
    }
    
    @IBAction func pearButtonSelected(_ sender: Any) {
        if pearButton.isSelected == true {
            pearButton.isSelected = false
            pearButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesFruitPre.remove("배")
        }
        else {
            pearButton.isSelected = true
            pearButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesFruitPre.insert("배")
        }
    }
    
    @IBAction func waterMelonButtonSelected(_ sender: Any) {
        if waterMelonButton.isSelected == true {
            waterMelonButton.isSelected = false
            waterMelonButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesFruitPre.remove("수박")
        }
        else {
            waterMelonButton.isSelected = true
            waterMelonButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesFruitPre.insert("수박")
        }
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        delegate?.sendAddesFruitPre(addesFruitPre: addesFruitPre)
    }
}

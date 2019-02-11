//
//  DairyViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

protocol SendAddesDairyPreDelegate {
    func sendAddesDairyPre(addesDairyPre: Set<String>)
}

class DairyViewController: UIViewController {

    var delegate: SendAddesDairyPreDelegate?
    
    var addesDairyPre: Set<String> = Set<String>()
    
    @IBOutlet weak var yogurtButton: UIButton!
    @IBOutlet weak var chocolateMilkButton: UIButton!
    @IBOutlet weak var milkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func yogurtButtonSelected(_ sender: Any) {
        if yogurtButton.isSelected == true {
            yogurtButton.isSelected = false
            yogurtButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesDairyPre.remove("요구르트")
        }
        else {
            yogurtButton.isSelected = true
            yogurtButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesDairyPre.insert("요구르트")
        }
    }
    
    @IBAction func chocolateMikButtonSelected(_ sender: Any) {
        if chocolateMilkButton.isSelected == true {
            chocolateMilkButton.isSelected = false
            chocolateMilkButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesDairyPre.remove("초코우유")
        }
        else {
            chocolateMilkButton.isSelected = true
            chocolateMilkButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesDairyPre.insert("초코우유")
        }
    }
    
    @IBAction func milkButtonSelected(_ sender: Any) {
        if milkButton.isSelected == true {
            milkButton.isSelected = false
            milkButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesDairyPre.remove("우유")
        }
        else {
            milkButton.isSelected = true
            milkButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesDairyPre.insert("우유")
        }
    }

    @IBAction func dismissButton(_ sender: Any) {
        delegate?.sendAddesDairyPre(addesDairyPre: addesDairyPre)
    }
}

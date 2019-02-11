//
//  FishViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

protocol SendAddesFishPreDelegate {
    func sendAddesFishPre(addesFishPre: Set<String>)
}

class FishViewController: UIViewController {

    var delegate: SendAddesFishPreDelegate?

    var addesFishPre: Set<String> = Set<String>()
    
    @IBOutlet weak var mackerelButton: UIButton!
    @IBOutlet weak var hairtailButton: UIButton!
    @IBOutlet weak var croakerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func mackerelButtonSelected(_ sender: Any) {
        if mackerelButton.isSelected == true {
            mackerelButton.isSelected = false
            mackerelButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesFishPre.remove("고등어")
        }
        else {
            mackerelButton.isSelected = true
            mackerelButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesFishPre.insert("고등어")
        }
    }
    
    @IBAction func hairtailButtonSelected(_ sender: Any) {
        if hairtailButton.isSelected == true {
            hairtailButton.isSelected = false
            hairtailButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesFishPre.remove("갈치")
        }
        else {
            hairtailButton.isSelected = true
            hairtailButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesFishPre.insert("갈치")
        }
    }
    
    @IBAction func croakerButtonSelected(_ sender: Any) {
        if croakerButton.isSelected == true {
            croakerButton.isSelected = false
            croakerButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            addesFishPre.remove("조기")
        }
        else {
            croakerButton.isSelected = true
            croakerButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            addesFishPre.insert("조기")
        }
    }

    @IBAction func dismissPush(_ sender: Any) {
    delegate?.sendAddesFishPre(addesFishPre: addesFishPre)
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

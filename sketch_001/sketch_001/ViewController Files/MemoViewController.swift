//
//  MemoViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, SaveData {

    @IBOutlet weak var memoTextView: UITextView!

    @IBOutlet weak var lisenceLabel: UILabel!
    var docsDir: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.delegateMemo = self
        
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        docsDir = dirPath[0].appendingPathComponent("memo.dat")
        
        do {
            let data = try Data(contentsOf: docsDir!)
            let content = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! String
            memoTextView.text = content
        } catch {
            print("error during the load in viewDidLoad() of Memo")
        }
        
      lisenceLabel.center.x = view.bounds.width*0.5
        if view.bounds.height < 600 { lisenceLabel.center.y = 467 }
        if (600 < view.bounds.height) && (view.bounds.height < 700) { lisenceLabel.center.y = 547 }
        if (700 < view.bounds.height) && (view.bounds.height < 800)
        {lisenceLabel.center.y = 617}
        if 800 < view.bounds.height { lisenceLabel.center.y = 736 }
    
        
        self.hideKeyboardWhenTappedAround()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        saveData()
    }
    
    func saveData() {
        let content = memoTextView.text
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: content!, requiringSecureCoding: false)
            try data.write(to: docsDir!)
        } catch {
            print("error during the save in saveData() of Memo")
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

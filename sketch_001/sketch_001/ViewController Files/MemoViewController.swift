//
//  MemoViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!

    var docsDir: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        docsDir = dirPath[0].appendingPathComponent("memo.dat")
        
        do {
            let data = try Data(contentsOf: docsDir!)
            let content = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! String
            memoTextView.text = content
        } catch {
            print("Error!")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let content = memoTextView.text
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: content!, requiringSecureCoding: false)
            try data.write(to: docsDir!)
        } catch {
            print("Error!")
        }
    }
}

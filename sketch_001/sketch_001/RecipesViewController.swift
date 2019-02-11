//
//  RecipesViewController.swift
//  sketch_001
//
//  Created by 이채운 on 10/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableBottomConstraint: NSLayoutConstraint!
    var numberOfRows: Int?
    @IBOutlet weak var contentView: UIView!
    
    var receips = [
        "계란을 푼다",
        "2번 레시피",
        "3번 레시피",
        "4번 레시피"
    ]
    
    var images = [
        "1",
        "2",
        "3",
        "4"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        scrollView.contentSize = contentView.bounds.size
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        self.tableBottomConstraint.constant = -CGFloat(numberOfRows! * 60)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows = 40
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for: indexPath) //as! RecipesTableViewCell
//        let recipe = receips[indexPath.row]
        
        cell.textLabel?.text = "dfsdsfsdfsdfsdf"
        cell.detailTextLabel?.text = "dgsgsdgsdgsdg"
        //        cell.numbers.image = UIImage(contentsOfFile: images[0])
        //        cell.recipeLabel.text = "dsfdsfdsddddddddddddddd"
        
        return cell
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


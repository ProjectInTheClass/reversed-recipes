//
//  TableViewController.swift
//  sketch_001
//
//  Created by 이채운 on 28/01/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return possibleFoodList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodListCell", for: indexPath) as! TableViewCell
        let food = possibleFoodList[indexPath.row]
        
        cell.foodName.text = food.name
        cell.foodTime.text = food.time
        cell.foodDescript.text = food.descript
        cell.foodImage.image = UIImage(named: food.thumbnail)
        cell.food = food
        
//        if let foodInCell = cell.food {
//            if bookMark.isBookmarked(foodInCell) {
//                cell.bookmarkButton.setImage(UIImage(named: "bookmark_filled"), for: .normal)
//            }
//            else{
//                cell.bookmarkButton.setImage(UIImage(named: "bookmark_outline"), for: .normal)
//            }
//        }
        return cell
    }
}

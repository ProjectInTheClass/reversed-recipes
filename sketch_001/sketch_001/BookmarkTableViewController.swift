//
//  BookmarkTableViewController.swift
//  sketch_001
//
//  Created by 이채운 on 10/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class BookmarkTableViewController: UITableViewController {
    
    var plistCoding = PlistCoding()
    var tmpIdArr = [Int]()
    var bookmarkedFoodArr = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //indexedPlist안에 bool 값이 true 인것들의 ID값을 모아놓는다.
        //그 ID값을 갖고있는 레시피들을 표출한다.
        //ID 값과 totalrecipes안에 있는 id값을 대조해서 같은 항목들을 표출한다.
        if let data = NSData(contentsOfFile: plistCoding.destPath) as Data?{
            plistCoding.indexedPlist = try!  plistCoding.decoder.decode([CheckPlist].self, from: data)
        }
        
        if let indexedPlist = plistCoding.indexedPlist{
            tmpIdArr = indexedPlist.filter({$0.bookmarked == true}).map({$0.id})
        }
        
        for id in tmpIdArr {
            if let totalRecipes = totalData.totalRecipes{
                bookmarkedFoodArr = totalRecipes.filter({$0.id == id})
            }
        }
        print("view will appear", bookmarkedFoodArr)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        bookmarkedFoodArr.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let indexedPlist = plistCoding.indexedPlist else {
            return 0
        }
        return indexedPlist.filter({$0.bookmarked == true}).count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCell", for: indexPath)
        as! TableViewCell
        let food = bookmarkedFoodArr[indexPath.row]
        
        cell.foodName.text = food.name
//        cell.foodTime.text = food.time
        cell.foodDescript.text = food.descript
        cell.foodImage.image = UIImage(named: food.thumbnail)
        cell.food = food
        // Configure the cell...

        return cell
    }
}

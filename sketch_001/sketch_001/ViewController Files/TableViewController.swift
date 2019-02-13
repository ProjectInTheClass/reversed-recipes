//
//  TableViewController.swift
//  sketch_001
//
//  Created by 이채운 on 28/01/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var plistCoding = PlistCoding()
    var possibleFoodList: [Food]?
    var selectedFood: Food?
    
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
        return possibleFoodList!.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFood = possibleFoodList![indexPath.row]
        performSegue(withIdentifier: "detailRecipesSegue", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodListCell", for: indexPath) as! FoodListCell
        let food = possibleFoodList![indexPath.row]
        
        cell.foodName.text = food.name
        cell.foodTime.text = food.time
        cell.foodDescript.text = food.descript
        cell.foodImage.image = UIImage(named: food.thumbnail)
        cell.food = food
        
        // 버튼을 누르면 도큐먼트 폴더의 plist를 읽어서 디코딩
        if let data = NSData(contentsOfFile: plistCoding.destPath) as Data?{
            plistCoding.indexedPlist = try!  plistCoding.decoder.decode([CheckPlist].self, from: data)
        }
        
        //이미 셀이 있으면 그것을 수정하고 없으면 생성
        let tmpCheckPlist = plistCoding.indexedPlist?.first(where: {$0.id == food.id})
        //현재 셀의 ID값과 도큐먼트에 있는 plist의 ID값이 같은 항목
        
        if tmpCheckPlist == nil{
            cell.bookmarkButton.isSelected = false
        }else {
            cell.bookmarkButton.isSelected = true
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailRecipesSegue") {
            let detailViewController = segue.destination as! DetailRecipesViewController
            
            detailViewController.food = selectedFood
        }
    }
}
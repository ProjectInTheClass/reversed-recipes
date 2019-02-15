//
//  IngredientTableViewController.swift
//  sketch_001
//
//  Created by 이채운 on 30/01/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class IngredientTableViewController: UITableViewController {

    var ingredients: [Ingredient]?
    var seasonings: [Seasoning]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        print("passed count:", ingredients?.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "식재료"
        }else if section == 1{
            return "조미료"
        }else{
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return ingredients!.count
        }else if section == 1{
            return seasonings!.count
        }else{
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientTableViewCell
        
        if indexPath.section == 0 {
            let ingredient = ingredients![indexPath.row]
            cell.ingredientIcon.image = UIImage(named: ingredient.icon)
            cell.ingredientName.text = ingredient.name
            cell.ingredientTerm.text = "\(ingredient.expirationDate)일"
            
        }else{
            let seasoning = seasonings![indexPath.row]
            cell.ingredientIcon.image = UIImage(named: seasoning.icon)
            cell.ingredientName.text = seasoning.name
        }
        return cell
    }
}

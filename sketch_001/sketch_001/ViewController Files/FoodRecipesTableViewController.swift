//
//  FoodRecipesTableViewController.swift
//  sketch_001
//
//  Created by 이채운 on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class FoodRecipesTableViewController: UITableViewController {
    
    var tmpArr = [
        "dsfsddsfsdfs",
        "dsfsddsfsd123fs",
        "dsfsddsfsd124fs",
        "dsfsddsfs512dfs",
        "dsfsddsfsd2134fs"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "first", for: indexPath) as! ImgageTableViewCell
            cell.foodImage.image = UIImage(named: "계란볶음밥")
            return cell
            
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "second", for: indexPath) as! IngredientsAndSeasoningViewCell
            cell.ingredientsName.text = "계란꼐란"
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "third", for: indexPath) as! DetailRecipeViewCell
            
            let detailRecipe = tmpArr[indexPath.row]
            cell.firstLabel.text = "1"
            cell.secondLabel.text = detailRecipe
            return cell
        }
    }
}

class ImgageTableViewCell: UITableViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class IngredientsAndSeasoningViewCell: UITableViewCell {
    @IBOutlet weak var ingredientsName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class DetailRecipeViewCell: UITableViewCell {
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


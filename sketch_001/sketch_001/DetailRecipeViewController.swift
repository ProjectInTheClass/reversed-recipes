//
//  DetailRecipeViewController.swift
//  sketch_001
//
//  Created by 이채운 on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class DetailRecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let foodImageViewCellIdentifier = "FoodImage"
    let ingredientViewCellIdentifier = "Ingredients"
    let recipeViewCellIdentifier = "Recipes"
    
    @IBOutlet weak var tableView: UITableView!
    
    var detailFoodImage = "계란볶음밥"
    var detailIngredients = ["계란", "양파", "밥", "에그", "ㅇㄹ", "df", "sdf"]
    var detailRecipes = [
        "밥을 넣고 볶는다",
        "ㅇㅇㄹㅇㄹㄴㅇㄹ",
        "ㄴㅇㄹㄴㅇㄹㅇㄴㄹㄴㅇ",
        "ㄴㅇㄹㅇㄴㄹㄴㄹ"
    ]

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
            //detailRecipes.count + detailIngredients.count + detailRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            // 재료가 4개 이하일 때
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: foodImageViewCellIdentifier, for: indexPath) as! FoodImageViewCell
                cell.foodDetailImage.image = UIImage(named: detailFoodImage)
                cell.detailFoodName.text = detailFoodImage
                cell.detailFoodTime.text = "15분"
                return cell
                // food image
                
            }else if indexPath.row <= Int(ceil(Double(detailIngredients.count)/4.0)) {
                if let cell = tableView.dequeueReusableCell(withIdentifier: ingredientViewCellIdentifier, for: indexPath) as? IngredientAndSeasoningViewCell {
                    
                cell.firstIngredient?.text = detailIngredients[0+(indexPath.row-1)*4]
                
                cell.secondIngredient?.text = detailIngredients[1+(indexPath.row-1)*4]
                
                cell.thirdIngredient?.text = detailIngredients[2+(indexPath.row-1)*4]
                    
                cell.fourthIngredient?.text = detailIngredients[3+(indexPath.row-1)*4]
                    
                return cell
                // ingredients
                }else{
                    return UITableViewCell()
                }
                
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: recipeViewCellIdentifier, for: indexPath) as! DetailRecipesViewCell
                cell.detailRecipe.text = detailRecipes[indexPath.row - 2]
                return cell
            }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
    }
}

class FoodImageViewCell: TableViewCell {
    @IBOutlet weak var foodDetailImage: UIImageView!
    @IBOutlet weak var detailFoodName: UILabel!
    @IBOutlet weak var detailBookmarkButton: UIButton!
    @IBOutlet weak var detailFoodTime: UILabel!
    
    
}
class IngredientAndSeasoningViewCell: TableViewCell {
    @IBOutlet weak var firstIngredient: UILabel?
    @IBOutlet weak var secondIngredient: UILabel?
    @IBOutlet weak var thirdIngredient: UILabel?
    @IBOutlet weak var fourthIngredient: UILabel?
    
}
class DetailRecipesViewCell: TableViewCell {
    @IBOutlet weak var detailRecipe: UILabel!
    
}

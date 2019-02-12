//
//  MyRefrigeratorViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class MyRefrigeratorViewController: UIViewController {
    
    // 임시 나의 재료
    let ingredients = [
        Ingredient(name: "양파", icon: "onions", ´class´: .vegetable, expirationDate: 5),
        Ingredient(name: "계란", icon: "eggs", ´class´: .eggs, expirationDate: 5),
        Ingredient(name: "돼지고기", icon: "pork", ´class´: .meat, expirationDate: 5),
        Ingredient(name: "우유", icon: "milk", ´class´: .dairyGoods, expirationDate: 3),
        Ingredient(name: "대파", icon: "leek", ´class´: .vegetable, expirationDate: 3),
        Ingredient(name: "밥", icon: "rice", ´class´: .rice, expirationDate: 3)
    ]
    
    let seasonings = [
        Seasoning(name: "소금", icon: "salt"),
        Seasoning(name: "설탕", icon: "salt"),
        Seasoning(name: "간장", icon: "soy")
    ]
    
    var totalData: TotalData?
    var possibleFoodList: [Food]?
    
    @IBAction func showRecipes(_ sender: Any) {
//        var ingredientsList = [String]()
//        possibleFoodList = [Food]()
//
//        for ingredient in ingredients {
//            ingredientsList.append(ingredient.name)
//        }
//        guard let totalRecipes = totalData?.totalRecipes else {
//            return
//        }
//        for food in totalRecipes {
//            if let ingredients = food.ingredients{
//                let eachIngre = Set(ingredients.components(separatedBy: ", "))
//                if eachIngre.isSubset(of: ingredientsList){
//                    possibleFoodList?.append(food)
//                    print(possibleFoodList)
//                }
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabBarController = self.tabBarController as! TabBarController
        totalData = tabBarController.totalData
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "myRefrigeratorEmbeddedSegue") {
            let childViewController = segue.destination as! IngredientTableViewController
            
            childViewController.ingredients = ingredients
            childViewController.seasonings = seasonings
        }
        
        if (segue.identifier == "foodListSegue") {
            let foodListViewController = segue.destination as! FoodListViewController
            
            foodListViewController.ingredients = ingredients
            
            var ingredientsList = [String]()
            possibleFoodList = [Food]()
            
            for ingredient in ingredients {
                ingredientsList.append(ingredient.name)
            }
            guard let totalRecipes = totalData?.totalRecipes else {
                return
            }
            for food in totalRecipes {
                if let ingredients = food.ingredients{
                    let eachIngre = Set(ingredients.components(separatedBy: ", "))
                    if eachIngre.isSubset(of: ingredientsList){
                        possibleFoodList?.append(food)
                        print(possibleFoodList)
                    }
                }
            }
            
            foodListViewController.possibleFoodList = possibleFoodList
        }
    }
}

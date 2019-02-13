//
//  MyRefrigeratorViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class MyRefrigeratorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ModalActionDelegate {


    @IBOutlet weak var showFoodButton: UIButton!
    @IBOutlet weak var ingredientTableView: UITableView!
    // 임시 나의 재료
    
    var ingredients = [
        Ingredient(name: "양파", icon: "onions", ´class´: "vegetable", expirationDate: 5),
        Ingredient(name: "달걀", icon: "eggs", ´class´: "eggs", expirationDate: 5),
        Ingredient(name: "돼지고기", icon: "pork", ´class´: "meat", expirationDate: 5),
        Ingredient(name: "우유", icon: "milk", ´class´: "dairyGoods", expirationDate: 3),
        Ingredient(name: "대파", icon: "leek", ´class´: "vegetable", expirationDate: 3),
        Ingredient(name: "밥", icon: "rice", ´class´: "rice", expirationDate: 3),
        Ingredient(name: "김치", icon: "onions", ´class´: "vegetable", expirationDate: 10),
        Ingredient(name: "마늘", icon: "onions", ´class´: "vegetable", expirationDate: 10)
    ]
    
    var tmpIngredient = [Ingredient]()
    
    var seasonings = [
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
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
        
        showFoodButton.layer.cornerRadius = 0.05 * showFoodButton.bounds.size.width
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabBarController = self.tabBarController as! TabBarController
        totalData = tabBarController.totalData
        print(ingredients.count)
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
        ingredientTableView.reloadData()
    }
    
    func completeModalAction(_ ingredient: [Ingredient], _ seasoning: [Seasoning]) {
        ingredients.append(contentsOf: ingredient)
        seasonings.append(contentsOf: seasoning)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "식재료"
        }else if section == 1{
            return "조미료"
        }else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return ingredients.count
        }else if section == 1{
            return seasonings.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientTableViewCell
        
        if indexPath.section == 0 {
            let ingredient = ingredients[indexPath.row]
            cell.ingredientIcon.image = UIImage(named: ingredient.icon)
            cell.ingredientName.text = ingredient.name
            cell.ingredientTerm.text = "\(ingredient.expirationDate)일"
            cell.ingredientAmount.text = ""
            
        }else{
            let seasoning = seasonings[indexPath.row]
            cell.ingredientIcon.image = UIImage(named: seasoning.icon)
            cell.ingredientName.text = seasoning.name
            cell.ingredientAmount.text = ""
            cell.ingredientTerm.text = ""
            cell.ingredientString.text = ""
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addRefrigeratorSeague" {
            let addIngredientView = segue.destination as! AddRefrigeratorViewController
//            let tmpIngredientArr = addIngredientView.selectedCell
            addIngredientView.delegate = self
        }
        
        if segue.identifier == "foodListSegue" {
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

        /*
        if (segue.identifier == "myRefrigeratorEmbeddedSegue") {
            let childViewController = segue.destination as! IngredientTableViewController
            
//            ingredients.append(contentsOf: tmpIngredient)
            childViewController.ingredients = ingredients
            childViewController.seasonings = seasonings
//            childViewController.tableView.reloadData()
//            childViewController.viewWillAppear(true)
        }
        *///컨테이너 뷰일때 쓰이던 것

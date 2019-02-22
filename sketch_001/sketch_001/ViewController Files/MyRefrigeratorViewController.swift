//
//  MyRefrigeratorViewController.swift
//  sketch_001
//
//  Created by CAU on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class MyRefrigeratorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ModalActionDelegate, ChangeDate, SaveData {
    
    var docsDir: URL?

    @IBOutlet weak var showFoodButton: UIButton!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var emptyHomeImage: UIImageView!
    // 임시 나의 재료
//    var ingredients = [
//        Ingredient(name: "양파", icon: "onions", ´class´: "vegetable", expirationDate: 5),
//        Ingredient(name: "달걀", icon: "eggs", ´class´: "eggs", expirationDate: 5),
//        Ingredient(name: "돼지고기", icon: "pork", ´class´: "meat", expirationDate: 5),
//        Ingredient(name: "우유", icon: "milk", ´class´: "dairyGoods", expirationDate: 3),
//        Ingredient(name: "대파", icon: "leek", ´class´: "vegetable", expirationDate: 3),
//        Ingredient(name: "밥", icon: "rice", ´class´: "rice", expirationDate: 3),
//        Ingredient(name: "김치", icon: "onions", ´class´: "vegetable", expirationDate: 10),
//        Ingredient(name: "마늘", icon: "onions", ´class´: "vegetable", expirationDate: 10)
//    ]

    var ingredients: [Ingredient]?
    var seasonings: [Seasoning]?
    
    var tmpIngredient = [Ingredient]()

//    var seasonings = [
//        Seasoning(name: "소금", icon: "salt"),
//        Seasoning(name: "설탕", icon: "salt"),
//        Seasoning(name: "간장", icon: "soy")
//    ]
    
    var totalData: TotalData?
    var possibleFoodList: [Food]?
    var selectedIngredient: Ingredient?
    
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
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.delegateRefri = self
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
        ingredients = []
        seasonings = []
        
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docsDirOfIngre = dirPath[0].appendingPathComponent("myIngredient.dat")
        let docsDirOfSeas = dirPath[0].appendingPathComponent("mySeason.dat")
        
        do {
            let dataIngre = try Data(contentsOf: docsDirOfIngre)
            let dataSeas = try Data(contentsOf: docsDirOfSeas)
            ingredients = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataIngre) as? [Ingredient]
            seasonings = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataSeas) as? [Seasoning]
        } catch {
            print("error during the load in viewDidLoad() of MyRefri")
        }
        
        showFoodButton.layer.cornerRadius = 20.0 / 1.0
        
        if (ingredients!.count + seasonings!.count) == 0 {
            emptyHomeImage.isHidden = false
        }else{
            emptyHomeImage.isHidden = true
        }
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        saveData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabBarController = self.tabBarController as! TabBarController
        totalData = tabBarController.totalData
        if (ingredients!.count + seasonings!.count) == 0 {
            emptyHomeImage.isHidden = false
        }else{
            emptyHomeImage.isHidden = true
        }
        self.ingredientTableView.reloadData()
//        print(ingredients.count)
//        ingredientTableView.delegate = self
//        ingredientTableView.dataSource = self
//        ingredientTableView.reloadData(
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        tableView.headerView(forSection: 0)?.tintColor = UIColor(red: 255, green: 172, blue: 1, alpha: 0.5)
    }
    
    func completeModalAction(_ ingredient: [Ingredient], _ seasoning: [Seasoning]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let todayDate = Date()
        let todayDateStr = dateFormatter.string(from: todayDate)
        
        for eachIngredient in ingredient {
            if ingredients!.contains(where: {$0.name == eachIngredient.name}){
                print("이미 있습니다")
            }else{
                eachIngredient.startDate = todayDateStr
                ingredients!.append(eachIngredient)
                print("tmp", ingredients)
            }
        }
    
//        ingredients = tmpIngredient
        print("myIngre", ingredients)
        
        for seasoning in seasoning {
            if seasonings!.contains(where: {$0.name == seasoning.name}){
                print("이미 있습니다.")
            }else{
                seasonings!.append(seasoning)
            }
        }
        self.ingredientTableView.reloadData()
    }
    
    func changeDate(changedIngre: Ingredient) {
        for ingredient in ingredients! {
            if changedIngre.name == ingredient.name {
                ingredient.startDate = changedIngre.startDate
                break
            }
        }
    }
    
    func changeFrozen(changedIngre: Ingredient) {
        for ingredient in ingredients! {
            if changedIngre.name == ingredient.name {
                ingredient.isFrozen = changedIngre.isFrozen
                break
            }
        }
    }
    
    func saveData() {
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let docsDirOfIngre = dirPath[0].appendingPathComponent("myIngredient.dat")
        let docsDirOfSeas = dirPath[0].appendingPathComponent("mySeason.dat")
        
        do {
            let ingredientsNS = ingredients as NSArray?
            let seasoningsNS = seasonings as NSArray?
            let dataIngre = try NSKeyedArchiver.archivedData(withRootObject: ingredientsNS!, requiringSecureCoding: false)
            let dataSeas = try NSKeyedArchiver.archivedData(withRootObject: seasoningsNS!, requiringSecureCoding: false)
            try dataIngre.write(to: docsDirOfIngre)
            print("complete saving ingre")
            try dataSeas.write(to: docsDirOfSeas)
            print("complete saving seas")
        } catch {
            print("error during the save in saveData() of MyRefri")
        }
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
            if let tmpIngredients = ingredients{
                return tmpIngredients.count
            }else{
                return 0
            }
        }else if section == 1{
            if let tmpSeasonings = seasonings{
                return tmpSeasonings.count
            }else{
                return 0
            }
        }else{
            return 0
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
//                if var tmpIngredients = ingredients{
//                    tmpIngredients.remove(at: indexPath.row)
//                    tableView.deleteRows(at: [indexPath], with: .fade)
//                }else{
//                    print("nil")
//                }
                ingredients!.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else {
//                if var tmpSeasonings = seasonings{
//                    tmpSeasonings.remove(at: indexPath.row)
//                    tableView.deleteRows(at: [indexPath], with: .fade)
//                }
                seasonings!.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientTableViewCell
        
        if indexPath.section == 0 {
            if let ingredient = ingredients?[indexPath.row]{
                cell.ingredientIcon.image = UIImage(named: ingredient.icon)
                cell.ingredientName.text = ingredient.name
                if ingredient.isFrozen == true {
                    cell.ingredientTerm.text = "냉동"
                    cell.ingredientTerm.isEnabled = false
                } else {
                    if ingredient.expirationDate != -1 {
                        cell.ingredientTerm.isEnabled = true
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateStyle = .medium
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        
                        let calendar = Calendar(identifier: .gregorian)
                        let startDate = dateFormatter.date(from: ingredient.startDate!)
                        let endDate = calendar.date(byAdding: DateComponents(day: ingredient.expirationDate), to: startDate!)
                        let todayDate = Date()
                        let remainingDate = endDate!.timeIntervalSince(todayDate)
                        let remainingDays = Int(remainingDate / 86400)
                        
                        if remainingDays > 7 {
                            cell.ingredientTerm.text = ""
//                            cell.ingredientTerm.textColor = UIColor(displayP3Red: CGFloat(0)/255, green: CGFloat(230)/255, blue: CGFloat(28)/255, alpha: 1)
                        } else if remainingDays > 2 {
                            cell.ingredientTerm.text = ""
//                            cell.ingredientTerm.textColor = UIColor.yellow
                        } else {
                            cell.ingredientTerm.text = "경고"
//                            cell.ingredientTerm.textColor = UIColor.
                        }
                    } else {
                        cell.ingredientTerm.text = ""
//                        cell.ingredientTerm.textColor = UIColor.green
                    }
                }
            }
        }else{
            if let seasoning = seasonings?[indexPath.row]{
                cell.ingredientIcon.image = UIImage(named: seasoning.icon)
                cell.ingredientName.text = seasoning.name
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            selectedIngredient = ingredients![indexPath.row]
            performSegue(withIdentifier: "detailIngredientSegue", sender: self)
        } else {
            print("selected seasonings")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "addRefrigeratorSeague" {
            let addIngredientView = segue.destination as! AddRefrigeratorViewController
//            let tmpIngredientArr = addIngredientView.selectedCell
            addIngredientView.delegate = self
        }

//        if segue.identifier == "addRefrigeratorSeague" {
//            let addIngredientView = segue.destination as! AddRefrigeratorViewController
//            let tmpIngredientArr = addIngredientView.selectedCell
//            addIngredientView.delegate = self
//        }
        
        if segue.identifier == "detailIngredientSegue" {
            let detailIngredientViewController = segue.destination as! DetailIngredientViewController
            
            detailIngredientViewController.ingredient = selectedIngredient
            detailIngredientViewController.delegate = self
        }

        
        if segue.identifier == "foodListSegue" {
            let foodListViewController = segue.destination as! FoodListViewController
            
            foodListViewController.ingredients = ingredients
            var ingredientsList = [String]()
            possibleFoodList = [Food]()
            if let tmpIngredients = ingredients{
                for ingredient in tmpIngredients {
                    ingredientsList.append(ingredient.name)
                }
            }
//            for ingredient in ingredients {
//                ingredientsList.append(ingredient.name)
//            }
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

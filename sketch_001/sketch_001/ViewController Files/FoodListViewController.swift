//
//  FoodListViewController.swift
//  sketch_001
//
//  Created by 이채운 on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class FoodListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var ingredients: [Ingredient]?
    var possibleFoodList: [Food]?
    var ingreStr: IngreStr?
    var delegate: ReloadRecipes?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! IngredientsListCollectionViewCell
        
        let ingredient = ingredients![indexPath.row]
        cell.ingredientImage.image = UIImage(named: ingredient.icon)
        cell.ingredientName.text = ingredient.name
        cell.ingredientButton.layer.cornerRadius = 0.05 * cell.ingredientButton.bounds.size.width
        cell.ingreStr = ingreStr
        cell.delegate = delegate
//        cell.contentView.layer.cornerRadius = 6.0
//        cell.contentView.layer.borderWidth = 1.0
//        cell.contentView.layer.borderColor = UIColor.clear.cgColor
//        cell.contentView.layer.masksToBounds = true
//        cell.layer.shadowColor = UIColor.lightGray.cgColor
//        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
//        cell.layer.shadowRadius = 2.0
//        cell.layer.shadowOpacity = 1.0
//        cell.layer.masksToBounds = false;
//        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath

        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .horizontal
        myLayout.itemSize.width = CGFloat(exactly: 100.0)!
        collectionView.setCollectionViewLayout(myLayout, animated: true)
        // Do any additional setup after loading the view.
        
        ingreStr = IngreStr()
        ingreStr?.ingredientsList = []
        for ingredient in ingredients! {
            ingreStr?.ingredientsList?.append(ingredient.name)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "foodListEmbeddedSegue") {
            let childViewController = segue.destination as! TableViewController
            
            childViewController.possibleFoodList = possibleFoodList
            childViewController.vc = self
        }
    }
}

class IngredientsListCollectionViewCell: UICollectionViewCell {
    var possibleFoodList: [Food]?
    var ingreStr: IngreStr?
    var delegate: ReloadRecipes?
    @IBOutlet weak var ingredientImage: UIImageView!
    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var ingredientButton: UIButton!
    
    @IBAction func selectedIngredient(_ sender: Any) {
        if ingredientButton.isSelected {
//            print("append : \(ingredientName.text!)")
            ingredientButton.isSelected = !ingredientButton.isSelected
            ingreStr?.ingredientsList?.append(ingredientName.text!)
        } else {
//            print("delete : \(ingredientName.text!)")
            ingredientButton.isSelected = !ingredientButton.isSelected
            ingreStr?.ingredientsList = ingreStr?.ingredientsList?.filter { $0 != ingredientName.text! }
        }

        delegate?.reloadRecipes(ingreStrArr: ingreStr!.ingredientsList!)
//        print(ingreStr?.ingredientsList!)
    }
}

class IngreStr {
    var ingredientsList: [String]?
}

protocol ReloadRecipes {
    func reloadRecipes(ingreStrArr: [String])
}

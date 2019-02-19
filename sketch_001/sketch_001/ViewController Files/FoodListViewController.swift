//
//  FoodListViewController.swift
//  sketch_001
//
//  Created by 이채운 on 11/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class FoodListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = collectionView.cellForItem(at: indexPath)?.contentView as! IngredientsListCollectionViewCell
//
//        if cell.ingredientName.text!.count > 3 {
//            return CGSize(width: 160, height: 40)
//        } else {
//            return CGSize(width: 80, height: 40)
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = collectionView.cellForItem(at: indexPath) as? IngredientsListCollectionViewCell
//
//        if cell?.ingredientName.text?.count == 4 {
//            return CGSize(width: 150, height: 54)
//        }
        
        if ingredients![indexPath.row].name.count == 4 {
            return CGSize(width: 118, height: 54)
        }else if ingredients![indexPath.row].name.count == 3 {
            return CGSize(width: 105, height: 54)
        }else if ingredients![indexPath.row].name.count == 2 {
            return CGSize(width: 90, height: 54)
        }else{
        return CGSize(width: 80, height: 54)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! IngredientsListCollectionViewCell
        
        let ingredient = ingredients![indexPath.row]
        cell.ingredientImage.image = UIImage(named: ingredient.icon)
        cell.ingredientName.text = ingredient.name
        cell.ingredientButton.clipsToBounds = true
        cell.ingredientButton.layer.cornerRadius = 20.0 / 1.0
        cell.ingredientButton.layer.borderWidth = 0.2
        cell.ingredientButton.layer.borderColor = UIColor.lightGray.cgColor
        cell.ingreStr = ingreStr
        cell.delegate = delegate

        if cell.ingredientName.text!.count == 4 {
            cell.ingredientButton.frame.size = CGSize(width: 97, height: 43)
        } else if cell.ingredientName.text!.count == 3 {
            cell.ingredientButton.frame.size = CGSize(width: 92, height: 43)
        }else if cell.ingredientName.text!.count == 2 {
            cell.ingredientButton.frame.size = CGSize(width: 79, height: 43)
        }else{
            cell.ingredientButton.frame.size = CGSize(width: 67, height: 43)
        }

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
        if let tmpIngredients = ingredients {
            for ingredient in tmpIngredients {
                ingreStr?.ingredientsList?.append(ingredient.name)
            }
        }
//        for ingredient in ingredients! {
//            ingreStr?.ingredientsList?.append(ingredient.name)
//        }
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
    var translate: Translation?
    @IBOutlet weak var ingredientImage: UIImageView!
    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var ingredientButton: UIButton!

    
    override func awakeFromNib() {
        translate = Translation()
//        ingredientButton.layer.masksToBounds = true
//        ingredientButton.layer.cornerRadius = 10
//        ingredientButton.clipsToBounds = true
//
//        someView.layer.cornerRadius = 0.05 * showFoodButton.bounds.size.width
//        someView.alignmentRect()
        
    }
    
    @IBAction func selectedIngredient(_ sender: Any) {
        if ingredientButton.isSelected {
//            print("append : \(ingredientName.text!)")
            ingredientButton.isSelected = !ingredientButton.isSelected
            ingreStr?.ingredientsList?.append(ingredientName.text!)
            ingredientName.textColor = UIColor.black
            ingredientImage.image = UIImage(named: "\(ingredientName.text!)")
            
        } else {
//            print("delete : \(ingredientName.text!)")
            ingredientButton.isSelected = !ingredientButton.isSelected
            ingreStr?.ingredientsList = ingreStr?.ingredientsList?.filter { $0 != ingredientName.text! }
            ingredientImage.image = UIImage(named: "\(ingredientName.text!)" + "_gray")
            ingredientName.textColor = UIColor.lightGray
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

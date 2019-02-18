//
//  DetailRecipesViewController.swift
//  sketch_001
//
//  Created by 이채운 on 12/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit
import AlignedCollectionViewFlowLayout

class DetailRecipesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var food: Food?
    var translation: Translation?
    
//    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
 
    let detailFoodImageCollectionIdentifier = "FoodImage"
    let detailIngredientsCollectionIdentifier = "Ingredients"
    let detailSeasoningCollectionIdentifier = "Seasoning"
    let detailRecipesCollectionIdentifier = "Recipes"
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            if section == 1 {
                let ingredients = food!.ingredients!
                let eachIngre = Set(ingredients.components(separatedBy: ", "))
                return eachIngre.count
            }else if section == 2 {
                let seasonings = food!.seasoning!
                let eachSeas = Set(seasonings.components(separatedBy: ", "))
                return eachSeas.count
            }else {
                var countOfRecipe = 0
                food!.method1?.count != 0 ? countOfRecipe += 1 : print("nil")
                food!.method2?.count != 0 ? countOfRecipe += 1 : print("nil")
                food!.method3?.count != 0 ? countOfRecipe += 1 : print("nil")
                food!.method4?.count != 0 ? countOfRecipe += 1 : print("nil")
                food!.method5?.count != 0 ? countOfRecipe += 1 : print("nil")
                food!.method6?.count != 0 ? countOfRecipe += 1 : print("nil")
                food!.method7?.count != 0 ? countOfRecipe += 1 : print("nil")
                
                return countOfRecipe
            }
        }
    }
    
    var methodCound: Int?
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailFoodImageCollectionIdentifier, for: indexPath) as! DetailFoodImageCollectionViewCell
            cell.detailFoodImage.image = UIImage(named: food!.thumbnail)
            cell.detailFoodName.text = food?.name
            cell.detailFoodTime.text = food?.time
            return cell
            
        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailIngredientsCollectionIdentifier, for: indexPath) as! DetailIngredientsCollectionViewCell
            let ingredients = food?.ingredients!
            let eachIngre = Set(ingredients!.components(separatedBy: ", "))
            let ingreArr = Array(eachIngre)
            cell.detailIngredientName.text = ingreArr[indexPath.row]
            cell.detailIngredientImage.image = UIImage(named: translation!.ingreDictionary[ingreArr[indexPath.row]]!)
            return cell
            
        }else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailSeasoningCollectionIdentifier, for: indexPath) as! DetailSeasoningCollectionViewCell
            let seasonings = food!.seasoning!
            let eachSeas = Set(seasonings.components(separatedBy: ", "))
            let seasArr = Array(eachSeas)
            cell.detailSeasoningName.text = seasArr[indexPath.row]
            if let _ = translation!.seasDictionary[seasArr[indexPath.row]] {
                cell.detailSeasoningImage.image = UIImage(named: translation!.seasDictionary[seasArr[indexPath.row]]!)
            }
            return cell
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailRecipesCollectionIdentifier, for: indexPath) as! DetailRecipesCollectionViewCell

            switch indexPath.row {
            case 0:
                cell.detailRecipe.text = food?.method1!
                cell.detailRecipeMethod.image = UIImage(named: "method1")
            case 1:
                cell.detailRecipe.text = food?.method2!
                cell.detailRecipeMethod.image = UIImage(named: "method2")
            case 2:
                cell.detailRecipe.text = food?.method3!
                cell.detailRecipeMethod.image = UIImage(named: "method3")
            case 3:
                cell.detailRecipe.text = food?.method4!
                cell.detailRecipeMethod.image = UIImage(named: "method4")
            case 4:
                cell.detailRecipe.text = food?.method5!
                cell.detailRecipeMethod.image = UIImage(named: "method5")
            case 5:
                cell.detailRecipe.text = food?.method6!
                cell.detailRecipeMethod.image = UIImage(named: "method6")
            case 6:
                cell.detailRecipe.text = food?.method7!
                cell.detailRecipeMethod.image = UIImage(named: "method7")
            default:
                print("default")
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 0:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case 1:
            return UIEdgeInsets(top: 15, left: 15, bottom: 5, right: 15)
        case 2:
            return UIEdgeInsets(top: 5, left: 15, bottom: 20, right: 15)
        default:
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
        
//        return UIEdgeInsets(top: 30, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
//        return CGSize(width: (width / 4) - 30, height: 75)
        if indexPath.section == 0 {
            return CGSize(width: view.bounds.width, height: view.bounds.width*0.66)
        }else if indexPath.section == 1 {
            return CGSize(width: (width / 4) - 30, height: 75)
        }else if indexPath.section == 2 {
            let seasonings = food!.seasoning!
            let eachSeas = Set(seasonings.components(separatedBy: ", "))
            let seasArr = Array(eachSeas)
            if seasArr[0] == "" {
                return CGSize(width: (width / 4) - 30, height: 0)
            } else {
                return CGSize(width: (width / 4) - 30, height: 75)
            }
        }else {
            let collectionViewHeight = CGFloat(100)
            var height: Int?
            
            switch indexPath.row {
            case 0:
                height = (90 + 10 * (food!.method1!.count / 20))
            case 1:
                height = (90 + 10 * (food!.method2!.count / 20))
            case 2:
                height = (90 + 10 * (food!.method3!.count / 20))
            case 3:
                height = (90 + 10 * (food!.method4!.count / 20))
            case 4:
                height = (90 + 10 * (food!.method5!.count / 20))
            case 5:
                height = (90 + 10 * (food!.method6!.count / 20))
            case 6:
                height = (90 + 10 * (food!.method7!.count / 20))
            default:
                print("error in cell size")
            }
            
            return CGSize(width: view.bounds.width, height: CGFloat(height!))
            
            /*
            var cellHeight = CGFloat(exactly: 0.0)
            
            guard let recipeCount = cell.detailRecipe.text?.count else{
                return CGSize(width: 0, height: 0)
            }
            
            
            // 케이스마다 메서드의 글자 개수를 받아와서 몇 줄인지 정숫값으로 받아낸다.  받아낸 정숫값으로 CGSize의 높이를 찾아온다.
            switch indexPath.row {
            case 0:
                
            case 1:
                
            case 2:
                
            case 3:
                
            case 4:
                
            case 5:
                
            case 6:
                
            default:
                print("default")
            }
            */
            
            
//            return CGSize(width: view.bounds.width, height: collectionViewHeight)
            
            
            
            
          /*
            methodCound = food.me
            if let cellHeightTemp = food!.method1{
              var cellHeight = 88*(cellHeightTemp.count-(cellHeightTemp.count % 28))/28
                 return CGSize(width: view.bounds.width, height: CGFloat(exactly: cellHeight)!)// 3번 째 indexpath.row의 높이
            }
            else {
               return CGSize(width: view.bounds.width, height: CGFloat(exactly: 0)!)// 3번 째 indexpath.row의 높이
            }
        */
          //  var cellHeight:Int? = 88*(food!.method1?.count-(food!.method1.count % 28))/28
 //        return CGSize(width: view.bounds.width, height: CGFloat(exactly: 88/*cellHeight*/)!)// 3번 째 indexpath.row의 높이
        }
    }

    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        super.viewDidLoad()
        translation = Translation()
//        let alignedFlowLayout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .center)
//            collectionView.collectionViewLayout = alignedFlowLayout
    }
}

class DetailFoodImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var detailFoodImage: UIImageView!
    @IBOutlet weak var detailFoodName: UILabel!
    @IBOutlet weak var detailFoodTime: UILabel!
    
}

class DetailIngredientsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var detailIngredientName: UILabel!
    @IBOutlet weak var detailIngredientImage: UIImageView!
    
}

class DetailSeasoningCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var detailSeasoningImage: UIImageView!
    @IBOutlet weak var detailSeasoningName: UILabel!
    
}

class DetailRecipesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var detailRecipe: UILabel!
    @IBOutlet weak var detailRecipeMethod: UIImageView!
    
}

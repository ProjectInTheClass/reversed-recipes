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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    var detailFoodImage = "계란볶음밥"
//    var detailFoodTime = "10분"
//    var detailIngredients = ["계란", "양파", "밥", "에그", "ㅇㄹ", "df", "sdf"] //7
//    var detailSeasoning = ["소금", "설탕"]
//    var detailRecipes = [
//        "밥을 넣고 볶는다",
//        "ㅇㅇㄹㅇㄹㄴㅇㄹ",
//        "ㄴㅇㄹㄴㅇㄹㅇㄴㄹㄴㅇ",
//        "ㄴㅇㄹㅇㄴㄹㄴㄹ"
//    ]
 
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailFoodImageCollectionIdentifier, for: indexPath) as! DetailFoodImageCollectionViewCell
            cell.detailFoodImage.image = UIImage(named: food!.thumbnail)
            cell.detailFoodName.text = food?.thumbnail
            cell.detailFoodTime.text = food?.time
            return cell
            
        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailIngredientsCollectionIdentifier, for: indexPath) as! DetailIngredientsCollectionViewCell
            let ingredients = food?.ingredients!
            let eachIngre = Set(ingredients!.components(separatedBy: ", "))
            let ingreArr = Array(eachIngre)
            cell.detailIngredientName.text = ingreArr[indexPath.row]
//            cell.detailIngredientImage.image = UIImage(named: ingre)
            
            return cell
        }else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailSeasoningCollectionIdentifier, for: indexPath) as! DetailSeasoningCollectionViewCell
            let seasonings = food!.seasoning!
            let eachSeas = Set(seasonings.components(separatedBy: ", "))
            let seasArr = Array(eachSeas)
            cell.detailSeasoningName.text = seasArr[indexPath.row]
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailRecipesCollectionIdentifier, for: indexPath) as! DetailRecipesCollectionViewCell
            switch indexPath.row {
            case 0:
                cell.detailRecipe.text = food?.method1!
            case 1:
                cell.detailRecipe.text = food?.method2!
            case 2:
                cell.detailRecipe.text = food?.method3!
            case 3:
                cell.detailRecipe.text = food?.method4!
            case 4:
                cell.detailRecipe.text = food?.method5!
            case 5:
                cell.detailRecipe.text = food?.method6!
            case 6:
                cell.detailRecipe.text = food?.method7!
            default:
                print("default")
            }
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: view.bounds.width, height: 220)
        }else if indexPath.section == 1 {
            let collectionViewWidth = collectionView.bounds.width/5.0
            let collectionViewHeight = collectionViewWidth
            return CGSize(width: collectionViewWidth, height: collectionViewWidth)
        }else if indexPath.section == 2 {
            let collectionViewWidth = collectionView.bounds.width/5.0
            let collectionViewHeight = collectionViewWidth
            return CGSize(width: collectionViewWidth, height: collectionViewWidth)
        }else {
            return CGSize(width: view.bounds.width, height: CGFloat(exactly: 20.0)!)
        }
    }

    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        super.viewDidLoad()
        let alignedFlowLayout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .center)
            collectionView.collectionViewLayout = alignedFlowLayout
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
    
}

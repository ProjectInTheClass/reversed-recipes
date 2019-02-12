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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var detailFoodImage = "계란볶음밥"
    var detailFoodTime = "10분"
    var detailIngredients = ["계란", "양파", "밥", "에그", "ㅇㄹ", "df", "sdf"] //7
    var detailSeasoning = ["소금", "설탕"]
    var detailRecipes = [
        "밥을 넣고 볶는다",
        "ㅇㅇㄹㅇㄹㄴㅇㄹ",
        "ㄴㅇㄹㄴㅇㄹㅇㄴㄹㄴㅇ",
        "ㄴㅇㄹㅇㄴㄹㄴㄹ"
    ]
 
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
        }else if section == 1 {
            return detailIngredients.count
        }else if section == 2 {
            return detailSeasoning.count
        }else {
            return detailRecipes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailFoodImageCollectionIdentifier, for: indexPath) as! DetailFoodImageCollectionViewCell
            cell.detailFoodImage.image = UIImage(named: detailFoodImage)
            cell.detailFoodName.text = detailFoodImage
            cell.detailFoodTime.text = detailFoodTime
            return cell
            
        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailIngredientsCollectionIdentifier, for: indexPath) as! DetailIngredientsCollectionViewCell
            cell.detailIngredientName.text = detailIngredients[0]
            
            return cell
        }else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailSeasoningCollectionIdentifier, for: indexPath) as! DetailSeasoningCollectionViewCell
            cell.detailSeasoningName.text = detailSeasoning[0]
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailRecipesCollectionIdentifier, for: indexPath) as! DetailRecipesCollectionViewCell
            cell.detailRecipe.text = detailRecipes[0]
            
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

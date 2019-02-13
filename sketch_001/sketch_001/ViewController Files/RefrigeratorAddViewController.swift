//
//  RefrigeratorAddViewController.swift
//  sketch_001
//
//  Created by 이채운 on 12/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class RefrigeratorAddViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var addCollectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    var tmpIngre = ["고기류", "채소류", "생선류", "계란류"]
    var tmpSeasoning = ["설탕", "소금", "간장", "물엿"]
    
    //example contents

    var ingredientAddCollectionViewCellIdentifier = "Ingredient"
    var seasoningAddCollectionViewCellIdentifier = "Seasoning"
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return tmpIngre.count
        }else{
            return tmpSeasoning.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if segmentedControl.selectedSegmentIndex == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ingredientAddCollectionViewCellIdentifier, for: indexPath) as! IngredientAddCollectionViewCell
            cell.ingredientName.text = "first"
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: seasoningAddCollectionViewCellIdentifier, for: indexPath) as! SeasoningAddCollectionViewCell
            cell.seasoningName.text = "second"
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionView.delegate = self
        addCollectionView.dataSource = self
    }
 
    @IBAction func segmentedTapped(_ sender: Any) {
        addCollectionView.reloadData()
    }
}

class IngredientAddCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ingredientName: UILabel!
}

class SeasoningAddCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var seasoningName: UILabel!
}

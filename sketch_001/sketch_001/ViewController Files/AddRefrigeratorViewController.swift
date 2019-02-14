//
//  AddRefrigeratorViewController.swift
//  sketch_001
//
//  Created by 이채운 on 12/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit
import Foundation
import AlignedCollectionViewFlowLayout

class AddRefrigeratorViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: ModalActionDelegate?
    var addRefrigeratorCollectionViewIdentifier = "AddRefrigerator"
    
    var selectedIngredientCell = [Ingredient]()
    var selectedSeasoningCell = [Seasoning]()
    // delegate로 넘길 데이터
    
    var selectedIngredientString = [String]()
    var selectedSeasoningString = [String]()
    
    var totalIngredientData: TotalIngredientsData?
    var totalSeasoningData: TotalSeasoningData?
    
    var totalIngredients: [Ingredient]?
    var totalSeasoning: [Seasoning]?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Set(totalIngredients!.map({$0.´class´})).count + 1 //조미료
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return totalIngredients!.filter({$0.´class´ == "고기류"}).count
        case 1:
            return totalIngredients!.filter({$0.´class´ == "채소류"}).count
        case 2:
            return totalIngredients!.filter({$0.´class´ == "난류"}).count
        case 3:
            return totalIngredients!.filter({$0.´class´ == "밥류"}).count
        case 4:
            return totalIngredients!.filter({$0.´class´ == "유제품류"}).count
        case 5:
            return totalSeasoning!.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader{
            if indexPath.section < 5 {
                sectionHeader.sectionHeader.text = totalIngredients?.map({$0.´class´})[indexPath.section]
            }else{
                sectionHeader.sectionHeader.text = "조미료"
            }
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 50, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let width = UIScreen.main.bounds.width
        return UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 15)
//        let width = UIScreen.main.bounds.width
//        if width == 375 {
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        }else{
//            return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 0)
//        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: (width / 4) - 30, height: 75)
//        let width = UIScreen.main.bounds.width
//        if width == 375 {
//            return CGSize(width: (width / 5) - 5, height: 75)
//        }else{
//            return CGSize(width: (width / 5) - 10, height: 75)
//        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let cell = collectionView.cellForItem(at: indexPath) as! AddRefrigeratorCollectionViewCell

        switch indexPath.section {
        case 0...4:
            if selectedIngredientString.contains(cell.contentName.text!){
                selectedIngredientString.removeAll(where: {$0 == cell.contentName.text})
            }else{
                selectedIngredientString.append(cell.contentName.text!)
            }
        default:
            if selectedSeasoningString.contains(cell.contentName.text!){
                selectedSeasoningString.removeAll(where: {$0 == cell.contentName.text!})
            }else{
                selectedSeasoningString.append(cell.contentName.text!)
            }
        }
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: addRefrigeratorCollectionViewIdentifier, for: indexPath) as! AddRefrigeratorCollectionViewCell
        
        switch indexPath.section {
        case 0:
            cell.contentName.text = totalIngredients?.filter({$0.´class´ == "고기류"}).map({$0.name})[indexPath.item]
            cell.contentImage.image = UIImage(named: "Apple")
        case 1:
            cell.contentName.text = totalIngredients?.filter({$0.´class´ == "채소류"}).map({$0.name})[indexPath.item]
            cell.contentImage.image = UIImage(named: "Apple")
        case 2:
            cell.contentName.text = totalIngredients?.filter({$0.´class´ == "난류"}).map({$0.name})[indexPath.item]
            cell.contentImage.image = UIImage(named: "Apple")
        case 3:
            cell.contentName.text = totalIngredients?.filter({$0.´class´ == "밥류"}).map({$0.name})[indexPath.item]
            cell.contentImage.image = UIImage(named: "Apple")
        case 4:
            cell.contentName.text = totalIngredients?.filter({$0.´class´ == "유제품류"}).map({$0.name})[indexPath.item]
            cell.contentImage.image = UIImage(named: "Apple")
        case 5:
            cell.contentName.text = totalSeasoning![indexPath.item].name
            cell.contentImage.image = UIImage(named: "Apple")
        default:
            print("empty")
            }
        
        switch indexPath.section {
        case 0...4:
            if selectedIngredientString.contains(cell.contentName.text!){
                cell.backgroundColor = UIColor.gray
            }else{
                cell.backgroundColor = UIColor.white
            }
        default:
            if selectedSeasoningString.contains(cell.contentName.text!){
                cell.backgroundColor = UIColor.gray
            }else{
                cell.backgroundColor = UIColor.white
            }
        }
        self.navigationItem.rightBarButtonItem = addButton
        
        switch (selectedIngredientString + selectedSeasoningString).count {
        case 0:
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            addButton.tintColor = .lightGray
        default:
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            addButton.tintColor = self.view.tintColor
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        totalIngredientData = TotalIngredientsData()
        totalSeasoningData = TotalSeasoningData()
        totalIngredients = totalIngredientData?.totalIngredients
        totalSeasoning = totalSeasoningData?.totalSeasoning
//        let alignedFlowLayout = AlignedCollectionViewFlowLayout(horizontalAlignment: .justified, verticalAlignment: .center)
//        collectionView.collectionViewLayout = alignedFlowLayout
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {

        if let delegate = self.delegate {
            for ingredient in selectedIngredientString {
                selectedIngredientCell.append(totalIngredients!.first(where: {$0.name == ingredient})!)
            }
            for seasoning in selectedSeasoningString {
                selectedSeasoningCell.append(totalSeasoning!.first(where: {$0.name == seasoning})!)
            }
        
            delegate.completeModalAction(selectedIngredientCell, selectedSeasoningCell)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

class SectionHeader: UICollectionReusableView {
    @IBOutlet weak var sectionHeader: UILabel!
}

class AddRefrigeratorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var contentName: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
}

protocol ModalActionDelegate :class {
    func completeModalAction(_ ingredient: [Ingredient], _ seasoning: [Seasoning])
}

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
        
        let headerViewWidth = collectionView.bounds.width
        let headerViewHeight = collectionView.bounds.width/10.0
        return CGSize(width: headerViewWidth, height: headerViewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.bounds.width/5.0
        let collectionViewHeight = collectionViewWidth
        return CGSize(width: collectionViewWidth, height: collectionViewWidth)
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
        
        print(cell.contentName.text)
        print("ingre", selectedIngredientString)
        print("seasoning", selectedSeasoningString)

        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: addRefrigeratorCollectionViewIdentifier, for: indexPath) as! AddRefrigeratorCollectionViewCell
        
        switch indexPath.section {
        case 0:
            cell.contentName.text = totalIngredients?.filter({$0.´class´ == "고기류"}).map({$0.name})[indexPath.item]
        case 1:
            cell.contentName.text = totalIngredients?.filter({$0.´class´ == "채소류"}).map({$0.name})[indexPath.item]
        case 2:
            cell.contentName.text = totalIngredients?.filter({$0.´class´ == "난류"}).map({$0.name})[indexPath.item]
        case 3:
            cell.contentName.text = totalIngredients?.filter({$0.´class´ == "밥류"}).map({$0.name})[indexPath.item]
        case 4:
            cell.contentName.text = totalIngredients?.filter({$0.´class´ == "유제품류"}).map({$0.name})[indexPath.item]
        case 5:
            cell.contentName.text = totalSeasoning![indexPath.item].name
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
        let alignedFlowLayout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .center)
        collectionView.collectionViewLayout = alignedFlowLayout
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
}

class SectionHeader: UICollectionReusableView {
    @IBOutlet weak var sectionHeader: UILabel!
}

class AddRefrigeratorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var contentName: UILabel!
}

protocol ModalActionDelegate :class {
    func completeModalAction(_ ingredient: [Ingredient], _ seasoning: [Seasoning])
}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////


class BadgeButton: UIButton {
    var badgeLabel = UILabel()
    
    var badge: String? {
        didSet {
            addBadgeToButon(badge: badge)
        }
    }
    
    public var badgeBackgroundColor = UIColor.red {
        didSet {
            badgeLabel.backgroundColor = badgeBackgroundColor
        }
    }
    
    public var badgeTextColor = UIColor.white {
        didSet {
            badgeLabel.textColor = badgeTextColor
        }
    }
    
    public var badgeFont = UIFont.systemFont(ofSize: 12.0) {
        didSet {
            badgeLabel.font = badgeFont
        }
    }
    
    public var badgeEdgeInsets: UIEdgeInsets? {
        didSet {
            addBadgeToButon(badge: badge)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBadgeToButon(badge: nil)
    }
    
    func addBadgeToButon(badge: String?) {
        badgeLabel.text = badge
        badgeLabel.textColor = badgeTextColor
        badgeLabel.backgroundColor = badgeBackgroundColor
        badgeLabel.font = badgeFont
        badgeLabel.sizeToFit()
        badgeLabel.textAlignment = .center
        let badgeSize = badgeLabel.frame.size
        
        let height = max(18, Double(badgeSize.height) + 5.0)
        let width = max(height, Double(badgeSize.width) + 10.0)
        
        var vertical: Double?, horizontal: Double?
        if let badgeInset = self.badgeEdgeInsets {
            vertical = Double(badgeInset.top) - Double(badgeInset.bottom)
            horizontal = Double(badgeInset.left) - Double(badgeInset.right)
            
            let x = (Double(bounds.size.width) - 10 + horizontal!)
            let y = -(Double(badgeSize.height) / 2) - 10 + vertical!
            badgeLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        } else {
            let x = self.frame.width - CGFloat((width / 2.0))
            let y = CGFloat(-(height / 2.0))
            badgeLabel.frame = CGRect(x: x, y: y, width: CGFloat(width), height: CGFloat(height))
        }
        
        badgeLabel.layer.cornerRadius = badgeLabel.frame.height/2
        badgeLabel.layer.masksToBounds = true
        addSubview(badgeLabel)
        badgeLabel.isHidden = badge != nil ? false : true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addBadgeToButon(badge: nil)
        fatalError("init(coder:) has not been implemented")
    }
}


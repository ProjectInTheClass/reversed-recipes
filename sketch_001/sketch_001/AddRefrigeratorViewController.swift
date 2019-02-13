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
    var selectedCell = [String]()
    
    
    //////////////////////////////////////////////////////////////////////
    var tmpIngredientContents = [
        "고기류" : ["돼지고기", "소고기", "닭고기", "양고기"],
        "채소류" : ["양파", "당근", "무", "대파"],
        "계란류" : ["계란", "메추리알"],
        "조미료" : ["설탕", "소금", "간장", "물엿", "고추장", "고춧가루", "후추"]]
    var ingredientsClassName = ["고기류", "채소류", "계란류", "조미료"]
    //////////////////////////////////////////////////////////////////////
    // contents for test
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return tmpIngredientContents.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return tmpIngredientContents["고기류"]!.count
        case 1:
            return tmpIngredientContents["채소류"]!.count
        case 2:
            return tmpIngredientContents["계란류"]!.count
        case 3:
            return tmpIngredientContents["조미료"]!.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader{
            sectionHeader.sectionHeader.text = ingredientsClassName[indexPath.section]
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: addRefrigeratorCollectionViewIdentifier, for: indexPath) as! AddRefrigeratorCollectionViewCell
        
        switch indexPath.section {
        case 0:
            cell.contentName.text = tmpIngredientContents["고기류"]![indexPath.item]
        case 1:
            cell.contentName.text = tmpIngredientContents["채소류"]![indexPath.item]
        case 2:
            cell.contentName.text = tmpIngredientContents["계란류"]![indexPath.item]
        case 3:
            cell.contentName.text = tmpIngredientContents["조미료"]![indexPath.item]
        default:
            cell.contentName.text = ""
        }
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        // 현재 체크가 되어있는 지 확인
       
        let selectedIngredient = tmpIngredientContents[ingredientsClassName[indexPath.section]]![indexPath.row]
        
        if selectedCell.contains(selectedIngredient){
            selectedCell.removeAll(where: {$0 == selectedIngredient})
            cell.backgroundColor = UIColor.white
        }else{
            selectedCell.append(selectedIngredient)
            cell.backgroundColor = UIColor.gray
        }
        print(selectedCell)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell : UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        
        let selectedIngredient = tmpIngredientContents[ingredientsClassName[indexPath.section]]![indexPath.row]
        
        if selectedCell.contains(selectedIngredient) {
            cell.backgroundColor = UIColor.gray
        }else{
            cell.backgroundColor = UIColor.white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let alignedFlowLayout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .center)
        collectionView.collectionViewLayout = alignedFlowLayout
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if let delegate = self.delegate {
            let selectedIngre = selectedCell
            delegate.completeModalAction(selectedIngre)
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
    func completeModalAction(_ data : [String])
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


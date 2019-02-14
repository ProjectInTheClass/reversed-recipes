//
//  IngredientTableViewCell.swift
//  sketch_001
//
//  Created by 이채운 on 30/01/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ingredientIcon: UIImageView!
    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var ingredientTerm: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

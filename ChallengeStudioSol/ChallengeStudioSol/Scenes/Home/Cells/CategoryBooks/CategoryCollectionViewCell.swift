//
//  CategoryCollectionViewCell.swift
//  ChallengeStudioSol
//
//  Created by Fran Martins on 01/11/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    // MARK: Properties
    var toggle = true
    
    // MARK: Outlets
    @IBOutlet weak var buttonCategory: UIButton!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        buttonCategory.layer.cornerRadius = 20
        buttonCategory.layer.borderWidth = 0.6
        buttonCategory.layer.borderColor = UIColor.tabBarNormalIconColor?.cgColor
    }
    
    // MARK: Actions
    @IBAction func handlerButtonCategory(_ sender: Any) {
    }
}

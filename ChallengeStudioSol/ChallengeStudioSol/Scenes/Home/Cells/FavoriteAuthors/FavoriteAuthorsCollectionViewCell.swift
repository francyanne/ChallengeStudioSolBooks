//
//  FavoriteAuthorsCollectionViewCell.swift
//  ChallengeStudioSol
//
//  Created by Fran Martins on 01/11/22.
//

import UIKit

class FavoriteAuthorsCollectionViewCell: UICollectionViewCell {
    // MARK: Outlets
    @IBOutlet weak var imageAuthor: UIImageView!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelNumberOfBooks: UILabel!
    
    // MARK: Override
    override func awakeFromNib() {
        super.awakeFromNib()
        imageAuthor.layer.cornerRadius = 10
    }
}

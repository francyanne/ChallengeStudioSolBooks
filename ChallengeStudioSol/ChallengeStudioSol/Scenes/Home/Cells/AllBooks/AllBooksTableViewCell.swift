//
//  AllBooksTableViewCell.swift
//  ChallengeStudioSol
//
//  Created by Fran Martins on 01/11/22.
//

import UIKit

class AllBooksTableViewCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelBookName: UILabel!
    @IBOutlet weak var imageBook: UIImageView!
    
    // MARK: Override
    override func awakeFromNib() {
        super.awakeFromNib()
        imageBook.layer.cornerRadius = 10
    }
}

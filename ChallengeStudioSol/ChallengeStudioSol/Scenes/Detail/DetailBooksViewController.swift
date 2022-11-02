//
//  DetailBooksViewController.swift
//  ChallengeStudioSol
//
//  Created by Fran Martins on 01/11/22.
//

import UIKit

class DetailBooksViewController: UIViewController {
    // MARK: Properties
    var fillHeart = true
    
    // MARK: Outlets
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var labelNameBook: UILabel!
    @IBOutlet weak var labelNameAuthor: UILabel!
    @IBOutlet weak var labelTextBook: UILabel!
    @IBOutlet weak var buttonHeart: UIButton!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        fillHeart = true
    }
    
    // MARK: Methods
    private func fillButtonHeart(emptyHeart: Bool) {
        emptyHeart ? buttonHeart.setImage(UIImage(named: "heart"), for: .normal) : buttonHeart.setImage(UIImage(named: "purpleHeart"), for: .normal)
    }
    
    // MARK: Actions
    @IBAction func handlerButtonBack(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func handlerButtonHeart(_ sender: Any) {
        fillHeart.toggle()
        fillButtonHeart(emptyHeart: fillHeart)
    }
}

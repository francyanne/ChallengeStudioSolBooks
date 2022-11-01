//
//  PatternEmptyViewController.swift
//  ChallengeStudioSol
//
//  Created by Fran Martins on 01/11/22.
//

import UIKit
import Lottie

final class PatternEmptyViewController: UIViewController {
    // MARK: Properties
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAnimationScene()
    }
    
    // MARK: Methods
    private func setupAnimationScene() {
        animationView.animation = Animation.named("empty")
        animationView.isHidden = false
        view.addSubview(animationView)
        animationView.frame = view.bounds
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.center = view.center
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.2
        animationView.play()
    }
}

//
//  TabBarViewController.swift
//  ChallengeStudioSol
//
//  Created by Fran Martins on 01/11/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setViewControllers([homeController(), addTabIcon(), searchTabIcon(), favoriteTabIcon()], animated: true)
        selectedIndex = 0
    }
    
    // MARK: Methods
    private func setupTabBar() {
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()

        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.tabBarNormalIconColor ?? .systemGray]
        tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.tabBarSelectedIconColor ?? .purple]
        tabBarItemAppearance.selected.iconColor = .tabBarSelectedIconColor

        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.backgroundColor = .white

        tabBar.standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBarAppearance
        }
    }
    
    private func homeController() -> UINavigationController {
        let homeController = HomeViewController()
        homeController.tabBarItem = UITabBarItem(title: "Início", image: .home, tag: 0)
        let navigationController = UINavigationController(rootViewController: homeController)
        return navigationController
    }
    
    private func addTabIcon() -> UINavigationController {
        let addController = PatternEmptyViewController()
        addController.tabBarItem = UITabBarItem(title: "Adicionar", image: UIImage(systemName: "plus.circle.fill"), tag: 0)
        let navigationController = UINavigationController(rootViewController: addController)
        return navigationController
    }
    
    private func searchTabIcon() -> UINavigationController {
        let searchController = PatternEmptyViewController()
        searchController.tabBarItem = UITabBarItem(title: "Buscar", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        let navigationController = UINavigationController(rootViewController: searchController)
        return navigationController
    }
    
    private func favoriteTabIcon() -> UINavigationController {
        let favoriteController = PatternEmptyViewController()
        favoriteController.tabBarItem = UITabBarItem(title: "Favoritos", image: .fillHeart, tag: 0)
        let navigationController = UINavigationController(rootViewController: favoriteController)
        return navigationController
    }
}


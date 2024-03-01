//
//  SelectionTabBar.swift
//  NewMarvelCharacters
//
//  Created by António Loureiro on 28/02/2024.
//

import UIKit

class SelectionTabBar: UITabBarController {

    private enum Constants {
        static let searchTitle = "Search"
        static let searchIconName = "magnifyingglass"
        static let homeTitle = "Home"
        static let homeIconName = "house"
        static let favouritesTitle = "Favourites"
        static let favouritesIconName = "star"
        static let listViewTitle = "List View"
        static let listViewIconName = "list.bullet"
        static let tabBarTitleTransitionDuration: CGFloat = 0.2
    }

    private let characterService: CharacterServiceProtocol

    init(characterService: CharacterServiceProtocol) {
        self.characterService = characterService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        UITabBar.appearance().barTintColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
        delegate = self
        createSelectionTabBarViewControllers()
    }

    func createSelectionTabBarViewControllers() {

        viewControllers = [
            createNavigationController(for: HomeViewController(nibName: nil, bundle: nil), title: Constants.homeTitle, image: (UIImage(systemName: Constants.homeIconName) ?? UIImage(resource: .unavailable))),
            createNavigationController(for: SearchViewController(nibName: nil, bundle: nil), title: Constants.searchTitle, image: (UIImage(systemName: Constants.searchIconName) ?? UIImage(resource: .unavailable))),
            createNavigationController(for: FavouritesViewController(nibName: nil, bundle: nil), title: Constants.favouritesTitle, image: (UIImage(systemName: Constants.favouritesIconName) ?? UIImage(resource: .unavailable)))
        ]
    }

    private func createNavigationController(for rootViewController: UIViewController,
                                            title: String,
                                            image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.barStyle = .black
        rootViewController.navigationItem.title = title
        return navController
    }
}

extension SelectionTabBar: UITabBarControllerDelegate {
    ///From: https://stackoverflow.com/a/59521029
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadePushAnimator()
    }
}

//
//  MainFlowCoordinator.swift
//  reshape
//
//  Created by Veronika on 24.03.2022.
//

import Foundation
import UIKit

final class MainFlowCoordinator: CoordinatorProtocol{
    internal var window: UIWindow
    private lazy var tabBar: UITabBarController = UITabBarController()
    private lazy var navigationControllers = MainFlowCoordinator.makeNavigationControllers()
    init (window: UIWindow) {
        self.window = window
    }
    
    func start() {
        setupResults()
        setupDiet()
        setupProfile()
        let navigationControllers = NavControllerType.allCases.compactMap {
            self.navigationControllers[$0]
        }
        tabBar.setViewControllers(navigationControllers, animated: true)
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
    }
}

extension MainFlowCoordinator{
    private func setupResults() {
        guard let navController = navigationControllers[.results] else {
            fatalError("No navController")
        }
        let resultsContext = ResultsScreenContext(moduleOutput: nil)
        let resultsContainer = ResultsScreenContainer.assemble(with: resultsContext)
        navController.setViewControllers([resultsContainer.viewController], animated: true)
    }
    private func setupDiet() {
        guard let navController = navigationControllers[.diet] else {
            fatalError("No navController")
        }
        let dietContext = DietScreenContext(moduleOutput: nil)
        let dietContainer = DietScreenContainer.assemble(with: dietContext)
        navController.setViewControllers([dietContainer.viewController], animated: true)
    }
    
    private func setupProfile() {
        guard let navController = navigationControllers[.profile] else {
            fatalError("No navController")
        }
        let profileContext = ProfileScreenContext(moduleOutput: nil)
        let profileContainer = ProfileScreenContainer.assemble(with: profileContext)
        navController.setViewControllers([profileContainer.viewController], animated: true)
    }
    
    fileprivate static func makeNavigationControllers() -> [NavControllerType: UINavigationController] {
        var result: [NavControllerType: UINavigationController] = [:]
        NavControllerType.allCases.forEach { navControllerKey in
            let navigationController = UINavigationController()
            let tabBarItem = UITabBarItem(title: navControllerKey.title,
                                          image: navControllerKey.image,
                                          tag: navControllerKey.rawValue)
            navigationController.tabBarItem = tabBarItem
            result[navControllerKey] = navigationController
            
            navigationController.isNavigationBarHidden = true
        }
        return result
    }
}


fileprivate enum NavControllerType: Int, CaseIterable {
    case results, diet, profile
    
    var title: String {
        switch self {
        case .results:
            return "Итоги дня"
        case .diet:
            return "Рацион"
        case .profile:
            return "Профиль"
            
        }
    }
    
    var image: UIImage? {
        switch self {
        case .results:
            return UIImage(named: "results")
        case .diet:
            return UIImage(named: "diet")
        case .profile:
            return UIImage(named: "profile")
        }
    }
}
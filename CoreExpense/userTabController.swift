//
//  userTabController.swift
//  CoreExpense
//
//  Created by Pavithran P K on 22/10/24.
//

import UIKit

class userTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Config()
        
    }
    private func Config() {
        
        let presentVcHome = HomeViewController()
        presentVcHome.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let presentVcCash = CashViewController()
        presentVcCash.title = "cash"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let presentVcCard = CardViewController()
        presentVcCard.title = "card"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        presentVcHome.tabBarItem.image = UIImage(systemName: "house")
        presentVcHome.tabBarItem.title = "Home"
        presentVcCash.tabBarItem.image = UIImage(named: "SVGcash")
        presentVcCash.tabBarItem.title = "Cash"
        presentVcCard.tabBarItem.image = UIImage(named: "SVGcard")
        presentVcCard.tabBarItem.title = "Card"
        
        tabBar.backgroundColor = .systemGray6
        tabBar.tintColor = .label
        
        let NavToHome = UINavigationController(rootViewController: presentVcHome)
        let NavToCash = UINavigationController(rootViewController: presentVcCash)
        let NavToCard = UINavigationController(rootViewController: presentVcCard)
        
        self.setViewControllers([NavToHome,NavToCash,NavToCard], animated: true)
    }


}

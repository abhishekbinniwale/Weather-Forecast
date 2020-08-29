//
//  HomeScreenBuilder.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 29/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
import UIKit

protocol HomeScreenModuleBuilder : ModuleBuilder {
     static func assembleModule() -> UIViewController?
}

class HomeScreenBuilder: HomeScreenModuleBuilder {
    
    static func assembleModule() -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeScreenView = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController {
            let presenter = HomeScreenPresenter()
            let interactor =  HomeScreenInteractor()
            let router = HomeScreenRouter()
            
            homeScreenView.presenter = presenter
            presenter.view = homeScreenView
            presenter.interactor = interactor
            presenter.router = router
            router.viewController = homeScreenView
            
            let navigationController = UINavigationController(rootViewController: homeScreenView)
            return navigationController
        }
        
        return UIViewController()
    }
}

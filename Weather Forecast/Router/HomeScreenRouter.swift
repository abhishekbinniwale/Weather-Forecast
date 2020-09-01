//
//  HomeScreenRouter.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 29/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
import UIKit

protocol HomeScreenWireframe: class {
    func showAlert(title : String , message: String)
}

class HomeScreenRouter: RootRouter ,HomeScreenWireframe {
    
    weak var viewController : UIViewController?
    weak var presenter: HomeScreenPresenter?
    
    func showAlert(title : String , message: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(action)
            self.viewController?.present(alert, animated: true, completion: nil)
        }
    }
}

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
    
}

class HomeScreenRouter: HomeScreenWireframe {
    
    weak var viewController : UIViewController?
     weak var presenter: HomeScreenPresenter?
    
}

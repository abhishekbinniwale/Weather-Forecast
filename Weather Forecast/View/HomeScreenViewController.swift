//
//  HomeScreenViewController.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 29/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import UIKit

protocol HomeScreenView : class {
    
}

class HomeScreenViewController: UIViewController, HomeScreenView {

    var presenter : HomeScreenPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

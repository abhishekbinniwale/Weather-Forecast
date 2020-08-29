//
//  HomeScreenPresenter.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 29/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation


protocol HomeScreenPresentation : class {

    var router : HomeScreenWireframe! { get }
    var interactor : HomeScreenUseCase! { get }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisapper()
    
}

class HomeScreenPresenter: HomeScreenPresentation {
    
    weak var view: HomeScreenView?
    var router: HomeScreenWireframe!
    var interactor: HomeScreenUseCase!

    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func viewWillDisapper() {
        
    }
    
    
}

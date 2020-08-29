//
//  RootRouter.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 29/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
import UIKit

protocol RootWireframe: class {
    func presentMainScreen(in window: UIWindow)
}
class RootRouter: RootWireframe {
    
    func presentMainScreen(in window: UIWindow) {
        window.rootViewController?.dismiss(animated: true, completion: nil)
        window.rootViewController = nil
        //window.rootViewController = ContactListBuilder.assembleModule()
        window.makeKeyAndVisible()
    }
}

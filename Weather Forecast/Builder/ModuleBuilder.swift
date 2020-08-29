//
//  ModuleBuilder.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 29/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
import UIKit

public protocol ModuleBuilder {
    
    static func assembleModule() -> UIViewController?
}

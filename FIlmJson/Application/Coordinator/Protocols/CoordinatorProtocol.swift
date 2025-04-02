//
//  CoordinatorProtocol.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigatorController: UINavigationController { get set }
    
    func start()
}

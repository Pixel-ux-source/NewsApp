//
//  AppCoordinator.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit

public final class AppCoordinator: CoordinatorProtocol {
    var navigatorController: UINavigationController
    
    init(navigatorController: UINavigationController) {
        self.navigatorController = navigatorController
    }
    
    func start() {
        let vc = FilmController()
        vc.coordinator = self
        navigatorController.pushViewController(vc, animated: true)
    }
}

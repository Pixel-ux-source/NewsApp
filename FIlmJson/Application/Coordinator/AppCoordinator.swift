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
        let vc = Builder.build()
        vc.coordinator = self
        navigatorController.pushViewController(vc, animated: true)
    }
    
    func openToDetail(_ image: UIImage?, _ date: String?, _ title: String?, _ description: String?) {
        let vc = DetailController()
        vc.coordinator = self
        vc.didSelect(image, date, title, description)
        navigatorController.pushViewController(vc, animated: true)
    }
}

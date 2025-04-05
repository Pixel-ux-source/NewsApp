//
//  Presenter.swift
//  FIlmJson
//
//  Created by Алексей on 04.04.2025.
//

import UIKit

protocol DetailControllerProtocol: AnyObject {

}

protocol PresenterDetailProtocol: AnyObject {
    init(_ view: DetailControllerProtocol, _ model: [News])
    
    func showDetail()
}

final class PresenterDetail: PresenterDetailProtocol {
    weak var view: DetailControllerProtocol?
    var model: [News]
    
    init(_ view: any DetailControllerProtocol, _ model: [News]) {
        self.view = view
        self.model = model
    }
    
    func showDetail() {
        
    }
}

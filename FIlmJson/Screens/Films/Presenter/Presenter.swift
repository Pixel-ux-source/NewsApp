//
//  Presenter.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit
import CoreData

// MARK: – View Protocol
protocol NewsControllerProtocol: AnyObject {
    func setupData(_ model: [News])
}

// MARK: – Presenter Protocol
protocol PresenterProtocol: AnyObject {
    init(_ view: NewsControllerProtocol, _ model: [News])
    
    func showData()
}

// MARK: – Presenter Class 
final class Presenter: PresenterProtocol {
    weak var view: NewsControllerProtocol?
    var model: [News]
    
    init(_ view: NewsControllerProtocol, _ model: [News]) {
        self.view = view
        self.model = model
    }
    
    func showData() {
        view?.setupData(model)
    }
}


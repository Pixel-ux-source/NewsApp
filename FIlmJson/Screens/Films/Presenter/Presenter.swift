//
//  Presenter.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit

// Посмотреть в другом проекте как принимается api через date и как записать в базу через data
// Доделать presenter
// Что значит ! около файла в гит?

protocol NewsControllerProtocol: AnyObject {
    func setupData(_ model: [News])
}

protocol PresenterProtocol: AnyObject {
    init(_ view: NewsControllerProtocol, _ model: [News])
    
    func showData()
}

final class Presenter: PresenterProtocol {
    weak var view: NewsControllerProtocol?
    var model: [News]
    
    init(_ view: any NewsControllerProtocol, _ model: [News]) {
        self.view = view
        self.model = model
    }
    
    func showData() {
        view?.setupData(model)
    }
    

}



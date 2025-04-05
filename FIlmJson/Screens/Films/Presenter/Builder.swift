//
//  Builder.swift
//  FIlmJson
//
//  Created by Алексей on 02.04.2025.
//

import UIKit

protocol BuilderProtocol: AnyObject {
    func build() -> NewsController
}

final class Builder: BuilderProtocol {
    func build() -> NewsController {
        let view = NewsController()
        let model = CoreDataManager.shared.fetchData()
        let presenter = Presenter(view, model)
        view.presesnter = presenter
        
        return view
    }
}

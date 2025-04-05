//
//  Builder.swift
//  FIlmJson
//
//  Created by Алексей on 04.04.2025.
//

import UIKit

// как лучше объявлять модель? Через fetch или News(entity: , insertInto: )?
protocol BuilderDetailProtocol: AnyObject {
    func build() -> DetailController
}

final class BuilderDetail: BuilderDetailProtocol {
    func build() -> DetailController {
        let view = DetailController()
        let model = CoreDataManager.shared.fetchData()
        let presenter = PresenterDetail(view, model)
        view.presenter = presenter

        return view
    }
    
}

//
//  View.ext.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

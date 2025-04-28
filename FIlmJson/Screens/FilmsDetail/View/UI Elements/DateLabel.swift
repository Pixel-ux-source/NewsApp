//
//  DateLabel.swift
//  FIlmJson
//
//  Created by Алексей on 05.04.2025.
//

import UIKit

final class DateLabel: UILabel {
    // MARK: – Life Cycle
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureDate()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configure Date
    private func configureDate() {
        font = .systemFont(ofSize: 16, weight: .regular)
        textColor = .lightGray
        numberOfLines = 1
    }
}

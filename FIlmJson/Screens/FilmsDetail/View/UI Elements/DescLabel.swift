//
//  DescLabel.swift
//  FIlmJson
//
//  Created by Алексей on 05.04.2025.
//

import UIKit

final class DescLabel: UILabel {
    // MARK: – Life Cycle
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureDesc()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configure Description
    private func configureDesc() {
        font = .systemFont(ofSize: 16, weight: .regular)
        textColor = .white
        numberOfLines = 0
    }
}

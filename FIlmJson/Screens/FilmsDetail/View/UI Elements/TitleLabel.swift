//
//  TitleLabel.swift
//  FIlmJson
//
//  Created by Алексей on 05.04.2025.
//

import UIKit

final class TitleLabel: UILabel {
    // MARK: – Life Cycle
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureTitle()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configure Title
    private func configureTitle() {
        font = .systemFont(ofSize: 20, weight: .bold)
        textColor = .white
        numberOfLines = 0
    }
}

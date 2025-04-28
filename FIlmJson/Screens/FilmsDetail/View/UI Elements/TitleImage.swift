//
//  TitleImage.swift
//  FIlmJson
//
//  Created by Алексей on 04.04.2025.
//

import UIKit

final class TitleImage: UIImageView {
    // MARK: – Life Cycle
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureImage()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configure Image
    private func configureImage() {
        contentMode = .scaleAspectFill
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}

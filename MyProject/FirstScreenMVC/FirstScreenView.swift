//
//  FirstScreenView.swift
//  MyProject
//
//  Created by Niffle on 20.11.2022.
//

import Foundation
import UIKit

final class FirstScreenView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        return stackView
    }()

    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 75.0)
        label.numberOfLines = 3
        return label
    }()

    var pictureView: UIImageView = {
        let pictureView = UIImageView()
        pictureView.contentMode = .scaleAspectFit
        pictureView.isUserInteractionEnabled = true
        return pictureView
    }()

    var button: UIButton = {
        let button = UIButton()
        button.setTitle("Тыкни!", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 45.0)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        return button
    }()

    private func setupStackView() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(pictureView)
        stackView.addArrangedSubview(button)

        stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
    }
}

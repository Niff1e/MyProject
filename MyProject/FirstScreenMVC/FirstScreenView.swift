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
        setupButton()
        setupPictureGesture()
        setupStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private properties

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        return stackView
    }()

    private var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 75.0)
        label.numberOfLines = 3
        return label
    }()

    private var pictureView: UIImageView = {
        let pictureView = UIImageView()
        pictureView.contentMode = .scaleAspectFit
        pictureView.translatesAutoresizingMaskIntoConstraints = false
        pictureView.isUserInteractionEnabled = true
        return pictureView
    }()

    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Тыкни!", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 45.0)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    private var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .black
        indicator.style = .large
        indicator.stopAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        // indicator.hidesWhenStopped = true
        indicator.alpha = 0
        return indicator
    }()

    // MARK: - Internal properties

    var onButtonTap: (() -> Void)?
    var onPictureTap: (() -> Void)?

    // MARK: - Private methods

    private func setupButton() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    private func setupPictureGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        pictureView.addGestureRecognizer(tap)
    }

    private func setupStackView() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(pictureView)
        stackView.addArrangedSubview(button)
        self.addSubview(indicator)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 80.0),
            indicator.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -80.0),
            indicator.heightAnchor.constraint(equalToConstant: 100.0),
            indicator.widthAnchor.constraint(equalToConstant: 100.0)
        ])
    }

    // MARK: - Internal methods

    func setPictureViewImage(with image: UIImage) {
        self.pictureView.image = image
    }

    func setLabelText(with text: String) {
        self.label.text = text
    }
    
    func startAnimatingIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.indicator.startAnimating()
            self?.pictureView.alpha = 0
            self?.label.alpha = 0
            self?.indicator.alpha = 1
        }
    }
    
    func stopAnimatingIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.indicator.stopAnimating()
            self?.pictureView.alpha = 1
            self?.label.alpha = 1
            self?.indicator.alpha = 0
        }
    }

    // MARK: - @objc

    @objc func buttonAction() {
        self.onButtonTap?()
    }

    @objc func tapAction(_ sender: UITapGestureRecognizer) {
        self.onPictureTap?()
    }
}

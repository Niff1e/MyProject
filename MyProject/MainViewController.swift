//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit

class MainViewController: UIViewController {

    private(set) var stackView = UIStackView()
    private(set) var label = UILabel()
    private(set) var pictureView = UIImageView()
    private(set) var button = UIButton()

    private let model = Model()

    private func setupLabel() {
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 75.0)
        label.numberOfLines = 3

        stackView.addArrangedSubview(label)

        label.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 40).isActive = true
        label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    }

    private func setupPicture() {
        stackView.addArrangedSubview(pictureView)
        pictureView.contentMode = .scaleAspectFit

        addToPictureTapGesture()
    }

    func addToPictureTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction(_ :)))
        pictureView.addGestureRecognizer(tap)
        pictureView.isUserInteractionEnabled = true
    }

    @objc func tapAction(_ sender: UITapGestureRecognizer) {
        let newVC = PictureViewController()
        let pictureVCmodel = PictureModel()
        newVC.model = pictureVCmodel
        pictureVCmodel.image = model.image
        navigationController?.pushViewController(newVC, animated: true)
    }

    private func setupButton() {
        button.setTitle("Тыкни!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 45.0)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green

        stackView.addArrangedSubview(button)

        button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80.0).isActive = true

        button.addTarget(nil, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc func buttonAction() {
        model.tenPress()
    }

    private func setupStackView() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30

        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        setupLabel()
        setupPicture()
        setupButton()
    }

    private func setupModel() {
        pictureView.image = model.image
        label.text = model.imageTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        model.doSometing = { [weak self] in
            self?.setupModel()
        }
        setupModel()
        setupStackView()
    }
}

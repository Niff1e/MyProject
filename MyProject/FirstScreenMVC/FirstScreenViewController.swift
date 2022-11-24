//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit

final class FirstScreenViewController: UIViewController {

    var model: FirstScreenModel
    private var firstView = FirstScreenView()

    init(model: FirstScreenModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tapAction(_ sender: UITapGestureRecognizer) {
        let newVC = PictureViewController()
        let pictureVCmodel = PictureModel()
        newVC.model = pictureVCmodel
        pictureVCmodel.image = model.image
        navigationController?.pushViewController(newVC, animated: true)
    }

    @objc func buttonAction() {
        model.tenPress()
    }

    private func setupModel() {
        firstView.pictureView.image = model.image
        firstView.label.text = model.imageTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        model.doSometing = { [weak self] in
            self?.setupModel()
        }
        setupModel()
    }

    override func loadView() {
        firstView.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        firstView.pictureView.addGestureRecognizer(tap)
        view = firstView
    }
}

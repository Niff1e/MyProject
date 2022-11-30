//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit

final class FirstScreenViewController: UIViewController {

    let model: FirstScreenModel
    private let firstView = FirstScreenView()

    init(model: FirstScreenModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupModel() {
        firstView.setPictureViewImage(with: model.image)
        firstView.setLabelText(with: model.imageTitle)
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
        firstView.onButtonTap = { [weak self] in
            self?.model.tenPress()
        }

        firstView.onPictureTap = { [weak self] in
            let pictureVCmodel = PictureModel(image: (self?.model.image)!)
            let newVC = PictureViewController(model: pictureVCmodel)
            self?.navigationController?.pushViewController(newVC, animated: true)
        }
        view = firstView
    }
}

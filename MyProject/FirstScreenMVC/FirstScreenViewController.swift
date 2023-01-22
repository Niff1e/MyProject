//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit

final class FirstScreenViewController: UIViewController {

    // MARK: - Private properties

    private let model: FirstScreenModel
    private let firstView = FirstScreenView()

    // MARK: -

    init(model: FirstScreenModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func updateView() {
        firstView.setPictureViewImage(with: model.image)
        firstView.setLabelText(with: model.imageTitle)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        model.updateView = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.updateView()
        }
        model.whenFinishDownload = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.firstView.stopAnimatingIndicator()
        }
        model.whenStartDownload = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.firstView.startAnimatingIndicator()
        }
        model.tenPress()
    }

    override func loadView() {
        firstView.onButtonTap = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.model.tenPress()
        }

        firstView.onPictureTap = { [weak self] in
            guard let strongSelf = self else { return }
            let pictureVCmodel = PictureModel(image: strongSelf.model.image)
            let newVC = PictureViewController(model: pictureVCmodel)
            strongSelf.navigationController?.pushViewController(newVC, animated: true)
        }
        view = firstView
    }
}

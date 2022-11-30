//
//  PictureViewController.swift
//  MyProject
//
//  Created by Ниффл on 6.08.22.
//

import UIKit

final class PictureViewController: UIViewController, UIScrollViewDelegate {

    init(model: PictureModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let pictureView = PictureView()
    let model: PictureModel

    private func setupModel() {
        pictureView.setImage(image: model.image)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
    }

    override func loadView() {
        pictureView.setDelegateForScrollView(controller: self)
        pictureView.backgroundColor = .white
        view = pictureView
    }
}

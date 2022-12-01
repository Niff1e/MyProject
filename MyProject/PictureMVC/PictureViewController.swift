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

    // MARK: - Private properties

    private let pictureView = PictureView()
    private let model: PictureModel

    // MARK: - Private methods

    private func updateView() {
        pictureView.setImage(image: model.image)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    override func loadView() {
        // pictureView.backgroundColor = .white
        view = pictureView
    }
}

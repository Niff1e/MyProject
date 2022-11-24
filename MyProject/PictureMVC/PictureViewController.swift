//
//  PictureViewController.swift
//  MyProject
//
//  Created by Ниффл on 6.08.22.
//

import UIKit

final class PictureViewController: UIViewController, UIScrollViewDelegate {

    private var pictureView = PictureView()
    var model: PictureModel!

    private func setupModel() {
        pictureView.imageView.image = model.image
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return pictureView.imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupModel()
    }

    override func loadView() {
        pictureView.scrollView.delegate = self
        pictureView.scrollView.minimumZoomScale = 1.0
        pictureView.scrollView.maximumZoomScale = 5.0
        view = pictureView
    }
}

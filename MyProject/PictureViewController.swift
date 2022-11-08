//
//  PictureViewController.swift
//  MyProject
//
//  Created by Ниффл on 6.08.22.
//

import UIKit

class PictureViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var scrollView: UIScrollView!

    var model: PictureModel!

    private func setupModel() {
        imageView.image = model.image
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 5.0
    }
}

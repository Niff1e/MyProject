//
//  PictureViewController.swift
//  MyProject
//
//  Created by Ниффл on 6.08.22.
//

import UIKit

class PictureViewController: UIViewController, UIScrollViewDelegate {

    private var imageView = UIImageView()
    private var scrollView = UIScrollView()

    public var model: PictureModel!

    private func setupModel() {
        imageView.image = model.image
    }

    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        setupImageView()
    }

    private func setupImageView() {
        scrollView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 5.0
        setupScrollView()
        setupModel()
    }
}

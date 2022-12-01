//
//  PictureView.swift
//  MyProject
//
//  Created by Niffle on 24.11.2022.
//

import Foundation
import UIKit

final class PictureView: UIView, UIScrollViewDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPictureView()
        scrollView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private properties

    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        return scrollView
    }()

    // MARK: - ScrollView delegate methods

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    // MARK: - Private methods

    private func setupPictureView() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.addSubview(imageView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: imageView.topAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }

    // MARK: - Internal methods

    func setImage(image: UIImage) {
        self.imageView.image = image
    }
}

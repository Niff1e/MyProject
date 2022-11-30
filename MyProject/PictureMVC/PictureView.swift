//
//  PictureView.swift
//  MyProject
//
//  Created by Niffle on 24.11.2022.
//

import Foundation
import UIKit

final class PictureView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPictureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private

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

    private func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    private func setupPictureView() {
        self.addSubview(scrollView)
        scrollView.addSubview(imageView)

        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true

        scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
    }

    // MARK: Internal

    func setImage(image: UIImage) {
        self.imageView.image = image
    }

    func setDelegateForScrollView(controller: UIScrollViewDelegate) {
        self.scrollView.delegate = controller
    }
}

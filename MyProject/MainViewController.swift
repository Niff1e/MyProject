//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit

class MainViewController: UIViewController {

    private let model = Model()

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPVC" {
            guard let newVC = segue.destination as? PictureViewController else { return }
            let pictureVCmodel = PictureModel()
            pictureVCmodel.image = model.image
            newVC.model = pictureVCmodel
        }
    }

    @IBAction private func changePicPress(_ sender: Any) {
        model.tenPress()
    }

    private func setupModel() {
        imageView.image = model.image
        titleLabel.text = model.imageTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        model.doSometing = { [weak self] in
            self?.setupModel()
        }
        setupModel()
    }
}

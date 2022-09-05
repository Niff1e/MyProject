//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit

class ViewController: UIViewController {

    let model = Model()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPVC" {
            let pictureVCmodel = PictureControllerModel()
            pictureVCmodel.image = model.image
            guard let newVC = segue.destination as? PictureViewController else { return }
            newVC.model = pictureVCmodel
        }
    }

    @IBAction func changePicPress(_ sender: Any) {
        model.tenPress()
    }

    func setupModel() {
        imageView.image = model.image
        titleLabel.text = model.imageTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        model.doSometing = { [weak self] in
            self?.setupModel()
        }
        model.tenPress()
    }
}

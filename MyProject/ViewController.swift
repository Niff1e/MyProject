//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit

protocol ViewControllerDelegate: AnyObject  {
    func notification()
}


class ViewController: UIViewController, ViewControllerDelegate {
    
    let model = Model()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPVC" {
            let pictureVCmodel = PictureControllerModel()
            pictureVCmodel.image = model.image
            let newVC = segue.destination as! PictureViewController
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
    
    func notification() {
        setupModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        model.tenPress()
    }
}

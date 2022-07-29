//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit


class ViewController: UIViewController {
    
    var delegate: ModelDelegate?
    let model = Model()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func changePicPress(_ sender: Any) {
        delegate?.notification()
        setupModel()
    }
    
    func setupModel() {
        imageView.image = model.image
        titleLabel.text = model.imageTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = model
        delegate?.notification()
        setupModel()
    }
}

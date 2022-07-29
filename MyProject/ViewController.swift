//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit


class ViewController: UIViewController {
    
    var model = Model()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setupModel() {
        imageView.image = model.image
        titleLabel.text = model.imageTitle
    }
    
    @IBAction func changePicPress(_ sender: Any) {
        model.tenPress()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.doSomething = { [weak self] in
            self?.setupModel()
        }
        model.tenPress()
    }
}

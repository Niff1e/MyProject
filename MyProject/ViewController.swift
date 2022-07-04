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
    @IBOutlet weak var changePicButton: UIButton!
    var pressCount = 0
    
    @IBAction func changePicPress(_ sender: Any) {
        model.tenPress()
        
        imageView.image = model.image
        titleLabel.text = model.imageTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = model.image
        titleLabel.text = model.imageTitle
    }
}

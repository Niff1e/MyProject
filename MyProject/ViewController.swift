//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit


class ViewController: UIViewController {
    
    var delegate: ModelDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func changePicPress(_ sender: Any) {
        delegate?.tenPress()
        
        imageView.image = delegate?.image
        titleLabel.text = delegate?.imageTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = Model()
        imageView.image = delegate?.image
        titleLabel.text = delegate?.imageTitle
    }
}

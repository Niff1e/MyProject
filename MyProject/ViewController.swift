//
//  ViewController.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit


class ViewController: UIViewController {
    
    var doSomethig: (()-> Void)?
    
    let model = Model()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func doOwnself() {
        let controller = model.callback()
        if let doSometing = controller.doSomethig {
            doSometing()
        }
        imageView.image = model.image
        titleLabel.text = model.imageTitle
    }
    @IBAction func changePicPress(_ sender: Any) {
        doOwnself()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doOwnself()
    }
}

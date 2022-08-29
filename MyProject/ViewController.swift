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
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let pictureViewController = storyboard.instantiateViewController(withIdentifier: "PictureViewController") as? PictureViewController else { return }
        pictureViewController.image = model.image
        
        present(pictureViewController, animated: true, completion: nil)
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

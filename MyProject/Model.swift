//
//  Model.swift
//  MyProject
//
//  Created by Ниффл on 15.06.22.
//

import UIKit

protocol ModelDelegate {
    func notification()
}

class Model: ModelDelegate {
    var imageTitle: String
    var image: UIImage?
    var currentNameOfImage: String?
    var pressCount: Int = 0
    
    init() {
        let imageNumber = Int.random(in: 1...3)
        currentNameOfImage = String(imageNumber)
        if let image = UIImage(named: "\(imageNumber)") {
            self.image = image
            self.imageTitle = "Картинка \(imageNumber)"
        }
        else {
            self.imageTitle = "Smth went wrong"
            self.image = UIImage(named: "ErrorCase")
        }
    }
    
    func newPic() {
        var imageNumber = Int.random(in: 1...3)
        while self.currentNameOfImage == String(imageNumber) {
            imageNumber = Int.random(in: 1...3)
        }
        self.currentNameOfImage = String(imageNumber)
        if let image = UIImage(named: "\(imageNumber)") {
            self.image = image
            self.imageTitle = "Картинка \(imageNumber)"
        }
        else {
            self.imageTitle = "Smth went wrong"
            self.image = UIImage(named: "ErrorCase")
        }
    }
    
    func tenPress() {
        pressCount += 1
        if pressCount % 10 == 0 {
            self.image = UIImage(named: "LookingAggressively")
            self.imageTitle = "Прекроти!"
            pressCount = 0
        } else {
            self.newPic()
        }
    }
    
    func notification() {
        tenPress()
    }
}

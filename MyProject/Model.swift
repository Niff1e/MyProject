//
//  Model.swift
//  MyProject
//
//  Created by Ниффл on 15.06.22.
//

import UIKit



public class Model {
    public var imageTitle: String
    public var image: UIImage?
    private var currentNameOfImage: String?
    private var pressCount: Int = 0
    var doSometing: (() -> Void)?
    
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
        doSometing?()
    }
}

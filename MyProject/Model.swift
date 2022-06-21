//
//  Model.swift
//  MyProject
//
//  Created by Ниффл on 15.06.22.
//

import UIKit

enum ErrorsOfRandomNumberClass: Error {
    case imageNotFound
}


struct Model {
    let imageTitle: String
    let image: UIImage?
    
    init() {
        let imageNumber = Int.random(in: 1...4)
        if let image = UIImage(named: "\(imageNumber)") {
            self.image = image
            self.imageTitle = "Картинка \(imageNumber)"
        }
        else {
            self.imageTitle = "Smth went wrong"
            self.image = UIImage(named: "ErrorCase")
        }
    }
}

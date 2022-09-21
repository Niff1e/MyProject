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
    private var currentImageNumber = 0
    private var imageNumber = 0
    private var pressCount: Int = 0
    var doSometing: (() -> Void)?

    init() {
        self.imageNumber = Int.random(in: 1...3)
        self.currentImageNumber = imageNumber
        if let image = UIImage(named: "\(imageNumber)") {
            self.image = image
            self.imageTitle = "Картинка \(imageNumber)"
        } else {
            self.imageTitle = "Smth went wrong"
            self.image = UIImage(named: "ErrorCase")
        }
    }

    func tenPress() {
        let queue = DispatchQueue.global(qos: .utility)
        self.pressCount += 1
        if self.pressCount % 10 == 0 {
            self.image = UIImage(named: "LookingAggressively")
            self.imageTitle = "Прекроти!"
            self.imageNumber = Int.random(in: 1...3)
            self.pressCount = 0
        } else {
            queue.sync {
                sleep(3)
                while self.currentImageNumber == self.imageNumber {
                    self.imageNumber = Int.random(in: 1...3)
                }
                self.currentImageNumber = self.imageNumber
                if let image = UIImage(named: "\(self.currentImageNumber)") {
                    self.image = image
                    self.imageTitle = "Картинка \(self.currentImageNumber)"
                } else {
                    self.imageTitle = "Smth went wrong"
                    self.image = UIImage(named: "ErrorCase")
                }
            }
        }
        doSometing?()
    }
}

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
    private var currentImageNumber = 1
    private var pressCount: Int = 0
    var doSometing: (() -> Void)?
    private let queue: DispatchQueue

    init() {
        self.queue = DispatchQueue(label: "myQueue")
        if let image = UIImage(named: "\(currentImageNumber)") {
            self.image = image
            self.imageTitle = "Картинка \(currentImageNumber)"
        } else {
            self.imageTitle = "Smth went wrong"
            self.image = UIImage(named: "ErrorCase")
        }
    }

    func tenPress() {
        self.pressCount += 1
        if self.pressCount % 10 == 0 {
            self.image = UIImage(named: "LookingAggressively")
            self.imageTitle = "Прекроти!"
            self.pressCount = 0
            self.doSometing?()
        } else {
            self.queue.async { [weak self] in
                guard let strongSelf = self else { return }
                var imageNumber = Int.random(in: 1...3)
                while strongSelf.currentImageNumber == imageNumber {
                    imageNumber = Int.random(in: 1...3)
                }
                strongSelf.currentImageNumber = imageNumber
                if let image = UIImage(named: "\(strongSelf.currentImageNumber)") {
                    strongSelf.image = image
                    strongSelf.imageTitle = "Картинка \(strongSelf.currentImageNumber)"
                } else {
                    strongSelf.imageTitle = "Smth went wrong"
                    strongSelf.image = UIImage(named: "ErrorCase")
                }
                DispatchQueue.main.async {
                    strongSelf.doSometing?()
                }
            }
        }
    }
}

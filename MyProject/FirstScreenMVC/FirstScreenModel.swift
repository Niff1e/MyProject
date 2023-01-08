//
//  Model.swift
//  MyProject
//
//  Created by Ниффл on 15.06.22.
//

import UIKit

final class FirstScreenModel {

    // MARK: - Private(set) properties

    private(set) var imageTitle: String
    private(set) var image: UIImage

    // MARK: - Internal properties

    var doSometing: (() -> Void)?

    // MARK: - Private properties

    private var currentImageNumber = 1
    private var pressCount: Int = 0
    private let queue = DispatchQueue(label: "myQueue")
    private let urls = [
        "https://mobimg.b-cdn.net/v3/fetch/9d/9db2d4683d92f5f2045e9142fbd82633.jpeg",
        "https://phonoteka.org/uploads/posts/2021-06/1624471479_22-phonoteka_org-p-anime-oboi-gorizontalnie-krasivo-25.jpg",
        "https://avatars.mds.yandex.net/i?id=2931c05db613d78b6eaf2f7818eca3f8-5869745-images-thumbs&n=13"
    ]

    // MARK: -

    init() {
        if let url = URL(string: urls[currentImageNumber - 1]) {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    self.image = image
                    self.imageTitle = "Картинка \(currentImageNumber)"
                } else {
                    self.imageTitle = "Smth went wrong"
                    self.image = UIImage(named: "ErrorCase")!
                }
            } else {
                self.imageTitle = "Smth went wrong"
                self.image = UIImage(named: "ErrorCase")!
            }
        } else {
            self.imageTitle = "Smth went wrong"
            self.image = UIImage(named: "ErrorCase")!
        }
    }

    // MARK: - Internal methods

    func tenPress() {
        self.pressCount += 1
        if self.pressCount % 10 == 0 {
            self.image = UIImage(named: "LookingAggressively")!
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
                    strongSelf.image = UIImage(named: "ErrorCase")!
                }
                DispatchQueue.main.async {
                    strongSelf.doSometing?()
                }
            }
        }
    }
}

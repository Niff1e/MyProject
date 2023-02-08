//
//  Model.swift
//  MyProject
//
//  Created by Ниффл on 15.06.22.
//

import UIKit

final class FirstScreenModel {

    // MARK: - Private(set) properties

    private(set) var imageTitle: String = ""
    private(set) var image: UIImage?

    // MARK: - Internal properties

    var updateView: (() -> Void)?
    var whenStartDownload: (() -> Void)?
    var whenFinishDownload: (() -> Void)?

    // MARK: - Private properties

    private var currentImageNumber = 1
    private var pressCount: Int = 0
    private let urls = [
        "https://s00.yaplakal.com/pics/pics_original/2/7/5/17247572.jpg",
        "https://avatars.mds.yandex.net/i?id=b451f406c5f64c0072b8bfefbbc85b95_l-4817585-images-thumbs&n=27&h=384&w=480",
        "https://mixmag.io/wp-content/uploads/2021/05/girl-avatar-1024x608.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2yeV0nBNNcM90so1GkoNpKRGP2DbpNjdqZw&usqp=CAU"
    ]

    // MARK: - Internal methods

    func tenPress() {
        self.pressCount += 1
        if self.pressCount % 10 == 0 {
            self.image = UIImage(named: "LookingAggressively")!
            self.imageTitle = "Прекроти!"
            self.pressCount = 0
            self.updateView?()
        } else {
            let strongSelf = self
            var imageNumber = Int.random(in: 1...urls.count)
            if urls.count == 1 {
                imageNumber = urls.count
            } else {
                while strongSelf.currentImageNumber == imageNumber {
                    imageNumber = Int.random(in: 1...urls.count)
                }
            }
            strongSelf.currentImageNumber = imageNumber
            self.whenStartDownload?()
            self.downloadImage(withNumberInArray: strongSelf.currentImageNumber)
        }
    }

    private func downloadImage(withNumberInArray number: Int) {
        let stringUrl = self.urls[number - 1]
        guard let url = URL(string: stringUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            self.image = image
            self.imageTitle = "Картинка \(self.currentImageNumber)"
            DispatchQueue.main.async { [weak self] in
                self?.updateView?()
                self?.whenFinishDownload?()
            }
        }
        task.resume()
    }
}

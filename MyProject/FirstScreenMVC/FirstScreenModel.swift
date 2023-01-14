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
    private(set) var image: UIImage = .init()

    // MARK: - Internal properties

    var doSometing: (() -> Void)?
    var whenStartDownload: (() -> Void)?
    var whenFinishDownload: (() -> Void)?

    // MARK: - Private properties

    private var currentImageNumber = 1
    private var pressCount: Int = 0
    private let queue = DispatchQueue(label: "myQueue")
    private let urls = [
        "https://avatars.mds.yandex.net/i?id=80f33c4148247a3893d80500fc49c7ff728ccfe1-8497134-images-thumbs&n=13",
        "https://phonoteka.org/uploads/posts/2021-06/1624471479_22-phonoteka_org-p-anime-oboi-gorizontalnie-krasivo-25.jpg",
        "https://avatars.mds.yandex.net/i?id=2931c05db613d78b6eaf2f7818eca3f8-5869745-images-thumbs&n=13"
    ]
    private var urlsAndPictures: [String : UIImage] = [:]

    // MARK: -

    init() {
//        if let url = URL(string: urls[currentImageNumber - 1]) {
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    self.image = image
//                    self.imageTitle = "Картинка \(currentImageNumber)"
//                } else {
//                    self.imageTitle = "Smth went wrong"
//                    self.image = UIImage(named: "ErrorCase")!
//                }
//            } else {
//                self.imageTitle = "Smth went wrong"
//                self.image = UIImage(named: "ErrorCase")!
//            }
//        } else {
//            self.imageTitle = "Smth went wrong"
//            self.image = UIImage(named: "ErrorCase")!
//        }
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
                strongSelf.whenStartDownload?()
                let stringUrl = strongSelf.urls[strongSelf.currentImageNumber-1]
                guard let url = URL(string: stringUrl) else { return }
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard error == nil else { return }
                    guard let data = data else { return }
                    guard let downloadImage = UIImage(data: data) else { return }
                    DispatchQueue.main.async {
                        strongSelf.image = downloadImage
                        strongSelf.imageTitle = "Картинка \(strongSelf.currentImageNumber)"
                        strongSelf.doSometing?()
                        // sleep(3)
                        strongSelf.whenFinishDownload?()
                    }
                }
                task.resume()
            }
        }
    }
//                let stringUrl = strongSelf.urls[strongSelf.currentImageNumber-1]
//                let isContain = strongSelf.urlsAndPictures.keys.contains(where: { element in
//                    if stringUrl == element {
//                        return true
//                    } else {
//                        return false
//                    }
//                })
//                if isContain {
//                    guard let picture = strongSelf.urlsAndPictures[stringUrl] else { return }
//                    strongSelf.image = picture
//                    strongSelf.imageTitle = "Картинка \(strongSelf.currentImageNumber)"
//                } else {
//                    strongSelf.whenStartDownload?()
//                    guard let url = URL(string: stringUrl) else { return }
//                    strongSelf.image = strongSelf.downloadImage(from: url)
//                    strongSelf.urlsAndPictures[stringUrl] = strongSelf.image
//                    strongSelf.imageTitle = "Картинка \(strongSelf.currentImageNumber)"
//                }
                
                
                
                
                //                if let image = UIImage(named: "\(strongSelf.currentImageNumber)") {
                //                    strongSelf.image = image
                //                    strongSelf.imageTitle = "Картинка \(strongSelf.currentImageNumber)"
                //                } else {
                //                    strongSelf.imageTitle = "Smth went wrong"
                //                    strongSelf.image = UIImage(named: "ErrorCase")!
                //                }

    
    private func downloadImage(from url: URL) -> UIImage {
        var image = UIImage()
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            guard let downloadImage = UIImage(data: data) else { return }
            image = downloadImage
        }
        task.resume()
        return image
    }
}

//
//  SceneDelegate.swift
//  MyProject
//
//  Created by Ниффл on 27.05.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        let navigationVC = UINavigationController()
        let model = FirstScreenModel()
        let firstScreenVC = FirstScreenViewController(model: model)

        window?.windowScene = windowScene
        window?.rootViewController = navigationVC
        navigationVC.pushViewController(firstScreenVC, animated: false)
        window?.makeKeyAndVisible()
    }
}

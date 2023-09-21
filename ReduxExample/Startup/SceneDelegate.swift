//
//  SceneDelegate.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation
import UIKit
import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        //Small native DI for Example :)
        let appEnvironment : any AppEnvironment = AppEnvironmentImp()
        //screen factory init
        let screenFactory = ScreenFactoryImp(appEnvironment: appEnvironment)
        let window = UIWindow(windowScene: windowScene)
        let mainScreen = UIHostingController(rootView: screenFactory.makePostsScreen())
        
        self.window = window
        window.rootViewController = mainScreen
        window.makeKeyAndVisible()
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
      
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }

    func sceneWillResignActive(_ scene: UIScene) {
      
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
      
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
      
    }
}




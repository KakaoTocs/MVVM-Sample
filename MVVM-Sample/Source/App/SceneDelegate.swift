//
//  SceneDelegate.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/9/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        window.makeKeyAndVisible()
    
        let apiService = APIService()
        let profileManager = ProfileManger()
        
        let mainDependency = MainViewController.ViewModel.Dependency(apiService: apiService)
        let detailDependency = DetailViewController.ViewModel.Dependency(apiService: apiService)
        let profileDependency = ProfileViewModel.Dependency(apiService: apiService, profileManager: profileManager)
        let settingDependency = SettingViewModel.Dependency()
        
        let settingBuilder = SettingBuilder(dependency: settingDependency)
        
        let profileBuilder = ProfileBuilder(
            dependency: profileDependency,
            settingBuilder: settingBuilder
        )
        let detailBuilder = DetailBuilder(
            dependency: detailDependency,
            settingBuilder: settingBuilder
        )
        
        let mainBuilder = MainBuilder(
            dependency: mainDependency,
            detailBuilder: detailBuilder,
            profileBuilder: profileBuilder
        )
        
        let mainViewController = mainBuilder.build(
            payload: .init()
        )
        window.rootViewController = mainViewController
    }
}

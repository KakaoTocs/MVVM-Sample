//
//  DetailRouter.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

import UIKit

final class DetailRouter: RouterProtocol {
    weak var viewController: UIViewController?
    
    let settingBuilder: SettingBuilder
    
    init(settingBuilder: SettingBuilder) {
        self.settingBuilder = settingBuilder
    }
        
    func presentSetting(
        payload: DetailViewController.ViewModel.Payload
    ) {
//            let settingViewController = settingBuilder.build(
//                payload: payload
//            )
//            viewController?.present(settingViewController, animated: true)
    }
}

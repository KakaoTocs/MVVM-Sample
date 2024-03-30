//
//  ProfileRouter.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

import UIKit

struct ProfileRouter: RouterProtocol {
    
    weak var viewController: UIViewController?
    private let settingBuilder: SettingBuilder
    
    init(settingBuilder: SettingBuilder) {
        self.settingBuilder = settingBuilder
    }
    
    func presentSetting(
        payload: SettingViewModel.Payload
    ) {
        let settingViewController = settingBuilder.build(
            payload: payload
        )
        viewController?.present(settingViewController, animated: true)
    }
}

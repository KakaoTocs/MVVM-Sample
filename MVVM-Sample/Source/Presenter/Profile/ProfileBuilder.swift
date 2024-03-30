//
//  ProfileBuilder.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

struct ProfileBuilder {
    private let dependency: ProfileViewModel.Dependency
    private let settingBuilder: SettingBuilder
    
    init(
        dependency: ProfileViewModel.Dependency,
        settingBuilder: SettingBuilder
    ) {
        self.dependency = dependency
        self.settingBuilder = settingBuilder
    }
    
    func build(payload: ProfileViewModel.Payload) -> ProfileViewController {
        var router = ProfileRouter(settingBuilder: settingBuilder)
        let viewModel = ProfileViewModel(
            dependency: dependency,
            payload: payload,
            router: router
        )
        let viewController = ProfileViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}

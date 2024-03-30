//
//  SettingBuilder.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

struct SettingBuilder {
    private let dependency: SettingViewModel.Dependency
    
    init(dependency: SettingViewModel.Dependency) {
        self.dependency = dependency
    }
    
    func build(payload: SettingViewModel.Payload) -> SettingViewController {
        var router = SettingRouter()
        let viewModel = SettingViewModel(
            dependency: dependency,
            payload: payload,
            router: router
        )
        let viewController = SettingViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}

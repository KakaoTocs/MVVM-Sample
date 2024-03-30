//
//  DetailBuilder.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

final class DetailBuilder {
    private let dependency: DetailViewController.ViewModel.Dependency
    private let settingBuilder: SettingBuilder
    
    init(
        dependency: DetailViewController.ViewModel.Dependency,
        settingBuilder: SettingBuilder
    ) {
        self.dependency = dependency
        self.settingBuilder = settingBuilder
    }
    
    func build(
        payload: DetailViewController.ViewModel.Payload
    ) -> DetailViewController {
        let router = DetailRouter(
            settingBuilder: settingBuilder
        )
        let viewModel = DetailViewModel(
            dependency: dependency,
            payload: payload,
            router: router
        )
        let viewController = DetailViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}

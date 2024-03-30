//
//  MainBuilder.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

struct MainBuilder {
    
    private let dependency: MainViewController.ViewModel.Dependency
    private let detailBuilder: DetailBuilder
    private let profileBuilder: ProfileBuilder
    
    init(
        dependency: MainViewController.ViewModel.Dependency,
        detailBuilder: DetailBuilder,
        profileBuilder: ProfileBuilder
    ) {
        self.dependency = dependency
        self.detailBuilder = detailBuilder
        self.profileBuilder = profileBuilder
    }
    
    func build(
        payload: MainViewController.ViewModel.Payload
    ) -> MainViewController {
        let router = MainRouter(
            detailBuilder: detailBuilder,
            profileBuilder: profileBuilder
        )
        let viewModel = MainViewModel(
            dependency: dependency,
            payload: payload,
            router: router
        )
        let viewController = MainViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}

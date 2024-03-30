//
//  SettingViewModel.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

import Foundation
import Combine

// MARK: - Declaration
extension SettingViewModel {
    struct Dependency {
    }
    
    struct Payload {
    }
    
    enum Action {
    }
    
    struct Output {
    }
}

final class SettingViewModel: ViewModelProtocol {
    // MARK: - Private Property
    private let dependency: Dependency
    private let payload: Payload
    private let router: SettingRouter
    private var cancellables: Set<AnyCancellable> = .init()
    
    @Published var action: Action?
    let output: Output = .init()
    
    // MARK: - Initializer
    init(dependency: Dependency, payload: Payload, router: SettingRouter) {
        self.dependency = dependency
        self.payload = payload
        self.router = router
    }
    
    func bindAction() {
        $action
            .sink { [weak self] action in
                guard let action else { return }
                self?.processAction(action)
            }
            .store(in: &cancellables)
    }
    
    private func processAction(_ action: Action) {
        switch action {
        }
    }
    
    func bindOutput() {
    }
}

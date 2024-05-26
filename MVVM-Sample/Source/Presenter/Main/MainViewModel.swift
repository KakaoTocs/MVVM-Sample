//
//  MainViewModel.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

import Foundation
import Combine

extension MainViewModel {
    
    // MARK: - Declaration
    struct Dependency {
        let apiService: APIService
    }
    
    struct Payload {
    }
    
    enum Action {
        case plusButton
        case minusButton
        case selectButton
    }
    
    struct Output {
        let number: PassthroughSubject<String, Never> = .init()
        let presentDetailView: PassthroughSubject<Int, Never> = .init()
    }
}

final class MainViewModel: ViewModelProtocol {
    // MARK: - Private Property
    let dependency: Dependency
    private let payload: Payload
    private let router: MainRouter
    private var cancellables: Set<AnyCancellable> = .init()
    
    private let number: CurrentValueSubject<Int, Never> = .init(0)
    
    @Published var action: Action?
    let output: Output = .init()
    
    // MARK: - Initializer
    init(dependency: Dependency, payload: Payload, router: MainRouter) {
        self.dependency = dependency
        self.payload = payload
        self.router = router
        
        bindOutput()
        bindAction()
    }
    
    func bindAction() {
        $action
            .compactMap({ $0 })
            .sink { [weak self] action in
                self?.processAction(action)
            }
            .store(in: &cancellables)
    }
    
    private func processAction(_ action: Action) {
        switch action {
        case .plusButton:
            let updatedNumber = number.value + 1
            number.send(updatedNumber)
        case .minusButton:
            let updatedNumber = number.value - 1
            number.send(updatedNumber)
        case .selectButton:
            router.presentDetail(payload: .init(number: number.value))
        }
    }
    
    func bindOutput() {
        number
            .sink { [weak self] number in
                self?.output.number.send("\(number)")
            }
            .store(in: &cancellables)
    }
}


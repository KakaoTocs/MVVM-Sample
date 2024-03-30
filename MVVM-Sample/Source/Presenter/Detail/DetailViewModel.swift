//
//  DetailViewModel.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

import Foundation
import Combine

extension DetailViewModel {
    
    // MARK: - Declaration
    struct Dependency {
        let apiService: APIService
    }
    
    struct Payload {
        let number: Int
    }
    
    struct Action {
    }
    
    struct Output {
        let number: PassthroughSubject<String, Never> = .init()
    }
}

final class DetailViewModel: ViewModelProtocol {
    // MARK: - Private Property
    private let dependency: Dependency
    private let payload: Payload
    private let router: DetailRouter
    private var cancellables: Set<AnyCancellable> = .init()
    
    @Published var action: Action?
    let output: Output = .init()
    
    // MARK: - Initializer
    init(dependency: Dependency, payload: Payload, router: DetailRouter) {
        self.dependency = dependency
        self.payload = payload
        self.router = router
        
        bindAction()
        bindOutput()
    }
    
    func bindAction() {
    }
    
    func bindOutput() {
        output.number.send("\(payload.number)")
    }
}

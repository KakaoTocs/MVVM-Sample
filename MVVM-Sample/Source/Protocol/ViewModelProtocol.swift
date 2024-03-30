//
//  ViewModelProtocol.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/9/24.
//

import Combine

protocol ViewModelProtocol {
    associatedtype Action
    associatedtype Output
    associatedtype Dependency
    associatedtype Payload
    
    func bindAction()
    func bindOutput()
}

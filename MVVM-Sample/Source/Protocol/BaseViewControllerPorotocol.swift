//
//  BaseViewControllerPorotocol.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/9/24.
//

import UIKit

protocol BaseViewControllerPorotocol where Self: UIViewController {
    associatedtype ViewHolder: ViewHolderProtocol
    associatedtype ViewModel: ViewModelProtocol
    
    var viewHolder: ViewHolder { get }
    var viewModel: ViewModel { get }
}

extension BaseViewControllerPorotocol {
    func viewHolderConfigure() {
        viewHolder.place(in: view)
        viewHolder.configureConstraints(for: view)
    }
}

typealias BaseVC = UIViewController & BaseViewControllerPorotocol

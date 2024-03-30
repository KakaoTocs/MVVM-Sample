//
//  ProfileViewController.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

import UIKit
import Combine

final class ProfileViewController: BaseVC {
    
    // MARK: - Property
    let viewHolder: ProfileViewHolder = .init()
    let viewModel: ProfileViewModel
    
    private var cancelBag = Set<AnyCancellable>()
    
    // MARK: - Initializer
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewHolderConfigure()
    }
    
    func bindAction() {
    }
    
    func bindOutput() {
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  SettingViewController.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

import UIKit
import Combine

final class SettingViewController: BaseVC {
    
    // MARK: - Property
    let viewHolder: SettingViewHolder = .init()
    let viewModel: SettingViewModel
    
    private var cancelBag = Set<AnyCancellable>()
    
    // MARK: - Initializer
    init(viewModel: SettingViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewHolderConfigure()
        
        bindOutput()
        bindAction()
    }
    
    func bindAction() {
    }
    
    func bindOutput() {
    }
}

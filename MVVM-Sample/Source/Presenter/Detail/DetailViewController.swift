//
//  DetailViewController.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/9/24.
//

import UIKit
import Combine

final class DetailViewController: BaseVC {
    
    // MARK: - Property
    let viewHolder: DetailViewHolder = .init()
    let viewModel: DetailViewModel
    private var cancellables: Set<AnyCancellable> = .init()
    
    // MARK: - Initializer
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        viewHolderConfigure()
        configureUI()
        
        bindOutput()
        bindInput()
        
        viewModel.action = .viewDidLoad
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.action = .viewDidAppear
    }
    
    // MARK: - Private Method
    private func bindInput() {
    }
    
    private func bindOutput() {
        viewModel.output.number
            .sink { [weak self] text in
                self?.viewHolder.numberLabel.text = text
            }
            .store(in: &cancellables)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }
}

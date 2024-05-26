//
//  MainViewController.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/9/24.
//

import UIKit
import Combine

final class MainViewController: BaseVC {
    
    // MARK: - Property
    let viewHolder: MainViewHolder = .init()
    let viewModel: MainViewModel
    
    private var cancelBag = Set<AnyCancellable>()
    
    // MARK: - Initializer
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewHolderConfigure()
        configureUI()
        
        bindOutput()
        bindAction()
    }
    
    func bindAction() {
        viewHolder.plusButton.tapPublisher
            .sink(receiveValue: { [weak self] _ in
                self?.viewModel.action = .plusButton
            })
            .store(in: &cancelBag)
        
        viewHolder.minusButton.tapPublisher
            .sink(receiveValue: { [weak self] _ in
                self?.viewModel.action = .minusButton
            })
            .store(in: &cancelBag)
        
        
        viewHolder.selectButton.tapPublisher
            .sink(receiveValue: { [weak self] _ in
                self?.viewModel.action = .selectButton
            })
            .store(in: &cancelBag)
    }
    
    func bindOutput() {
        viewModel.output.number
            .sink(receiveValue: { [weak self] text in
                self?.viewHolder.numberLabel.text = text
            })
            .store(in: &cancelBag)
    }
    
    func configureUI() {
        view.backgroundColor = .white
    }
}

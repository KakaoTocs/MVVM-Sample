//
//  MainViewHolder.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

import UIKit
import SnapKit

final class MainViewHolder: ViewHolderProtocol {
    
    // MARK: - UI Component
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(.add, for: .normal)
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(.remove, for: .normal)
        return button
    }()
    
    let selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    // MARK: - Interface
    func place(in view: UIView) {
        view.addSubview(containerView)
        
        containerView.addSubview(numberLabel)
        containerView.addSubview(plusButton)
        containerView.addSubview(minusButton)
        containerView.addSubview(selectButton)
    }
    
    func configureConstraints(for view: UIView) {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        numberLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.center.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints { make in
            make.leading.equalTo(numberLabel.snp.trailing).offset(10)
            make.centerY.equalTo(numberLabel)
        }
        
        minusButton.snp.makeConstraints { make in
            make.trailing.equalTo(numberLabel.snp.leading).offset(-10)
            make.centerY.equalTo(numberLabel)
        }
        
        selectButton.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(10)
            make.centerX.equalTo(numberLabel)
        }
    }
}

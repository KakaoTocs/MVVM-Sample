//
//  DetailViewHolder.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

import UIKit
import SnapKit

final class DetailViewHolder: ViewHolderProtocol {
    
    // MARK: - UI Component
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    
    // MARK: - Interface
    func place(in view: UIView) {
        view.addSubview(containerView)
        
        containerView.addSubview(numberLabel)
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
    }
}

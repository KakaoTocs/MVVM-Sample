//
//  ViewHolderProtocol.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/9/24.
//

import UIKit

protocol ViewHolderProtocol {
    func place(in view: UIView)
    func configureConstraints(for view: UIView)
}

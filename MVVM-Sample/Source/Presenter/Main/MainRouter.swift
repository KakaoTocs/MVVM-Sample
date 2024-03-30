//
//  MainRouter.swift
//  MVVM-Sample
//
//  Created by 김진우 on 3/24/24.
//

import UIKit

final class MainRouter: RouterProtocol {
    
    weak var viewController: UIViewController?
    private let detailBuilder: DetailBuilder
    private let profileBuilder: ProfileBuilder
    
    init(
        detailBuilder: DetailBuilder,
        profileBuilder: ProfileBuilder
    ) {
        self.detailBuilder = detailBuilder
        self.profileBuilder = profileBuilder
    }
    
    func presentDetail(
        payload: DetailViewController.ViewModel.Payload
    ) {
        let detailViewController = detailBuilder.build(
            payload: payload
        )
        viewController?.present(detailViewController, animated: true)
    }
    
    func presentProfile(
        payload: ProfileViewModel.Payload
    ) {
        let profileViewController = profileBuilder.build(
            payload: payload
        )
        viewController?.present(profileViewController, animated: true)
    }
}

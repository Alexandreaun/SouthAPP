//
//  BaseViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 14/04/21.
//

import UIKit
import FSnapChatLoading

class BaseViewController: UIViewController {

    let loadingView = FSnapChatLoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoadingAnimation() {
        loadingView.show(view: self.view, color: .blueOil)
    }
    
    func hiddenLoadingAnimation() {
        loadingView.hide()
    }
}

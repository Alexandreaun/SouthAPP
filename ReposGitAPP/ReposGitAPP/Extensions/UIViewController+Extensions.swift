//
//  UIViewController+Extensions.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 14/04/21.
//

import UIKit

extension UIViewController {
    func showError(buttonLabel: String, titleError: String, messageError: String) {
        let error = ValidationError(titleError: titleError, messageError: messageError)
        let alert: UIAlertController = UIAlertController(title: error.domain, message: error.localizedDescription, preferredStyle: .alert)
        let actionOk: UIAlertAction = UIAlertAction(title: buttonLabel, style: .default, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
}

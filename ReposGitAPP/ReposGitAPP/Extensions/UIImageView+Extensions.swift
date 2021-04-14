//
//  UIImageView+Extensions.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 14/04/21.
//

import UIKit
import SDWebImage

extension UIImageView{
    func loadSDWebImage(imageView: UIImageView, string: String){
        imageView.sd_setImage(with: URL(string: string))
    }
}

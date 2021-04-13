//
//  ValidationError.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 09/04/21.
//

import Foundation

class ValidationError: NSError{
    
    var titleError: String = ""
    var messageError: String = ""
    
    init(titleError: String, messageError: String){
        super.init(domain: titleError, code: 400, userInfo: [NSLocalizedDescriptionKey: messageError])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

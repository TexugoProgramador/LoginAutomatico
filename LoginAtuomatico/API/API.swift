//
//  API.swift
//  LoginAtuomatico
//
//  Created by humberto Lima on 18/10/19.
//  Copyright © 2019 humberto Lima. All rights reserved.
//

import UIKit

class API: NSObject {
    func logaApp(email: String, senha: String, onSucess:@escaping (Bool) -> Void) {
        onSucess(true)
    }
}

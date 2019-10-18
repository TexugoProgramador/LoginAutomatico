//
//  SegundaTelaViewController.swift
//  LoginAtuomatico
//
//  Created by humberto Lima on 18/10/19.
//  Copyright © 2019 humberto Lima. All rights reserved.
//

import UIKit

class SegundaTelaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func deslogarApp(_ sender: UIButton) {
        dadosUsar.logOut()
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "inicioApp") as? UINavigationController {
            present(vc, animated: true, completion: nil)
        }
    }
}

//
//  ViewController.swift
//  LoginAtuomatico
//
//  Created by humberto Lima on 18/10/19.
//  Copyright © 2019 humberto Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var campoEmail: UITextField!
    @IBOutlet var campoSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // quando enra na tela, procura por um login salvo antes, se achar tenta logar, caso contrario segue o fluxo normal
    override func viewDidAppear(_ animated: Bool) {
        let dadoLogin = dadosUsar.buscarLogin()
        if dadoLogin.count > 1 {
            logarApp(emailUsar: dadoLogin[0], senhaUsar: dadoLogin[1])
        }
    }
    
    func alerta(title: String, mensagem:String){
        let alert = UIAlertController(title: title, message: mensagem, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func LoginApp(_ sender: UIButton) {
        guard campoEmail.text != "" else {
            self.alerta(title: "Aviso", mensagem: "Digite um e-mail")
            return
        }
        
        guard campoSenha.text != "" else {
            self.alerta(title: "Aviso", mensagem: "Digite uma senha")
            return
        }
        logarApp(emailUsar: campoEmail.text ?? "", senhaUsar: campoSenha.text ?? "")
    }
    
    func logarApp(emailUsar: String, senhaUsar: String) {
        apiUsar.logaApp(email: emailUsar, senha: senhaUsar) { (ret) in
            if ret {
                dadosUsar.salvaLogin(usuario: emailUsar, senha: senhaUsar)
                self.performSegue(withIdentifier: "LogouApp", sender: self)
            }else{
                self.alerta(title: "ERro", mensagem: "Ocorreu um erro ao logar")
            }
        }
    }
    
}


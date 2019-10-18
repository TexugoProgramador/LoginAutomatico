//
//  ManipulaDados.swift
//  LoginAtuomatico
//
//  Created by humberto Lima on 18/10/19.
//  Copyright © 2019 humberto Lima. All rights reserved.
//

import UIKit
import CoreData

class ManipulaDados: NSObject {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func salvaLogin(usuario:String, senha: String){
        
        limpaEntities(entity: "Usuario")
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Usuario", in: managedContext)!
        let usuarioInserir = NSManagedObject(entity: entity,  insertInto: managedContext)
        
        usuarioInserir.setValue(usuario, forKey: "usuario")
        usuarioInserir.setValue(senha, forKey: "senha")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Não foi possível salvar erro. \(error), \(error.userInfo)")
        }
    }
    
    func limpaEntities(entity:String) {
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do {
            try managedContext.execute(request)
        } catch {
            return
        }
    }
    
    func buscarLogin() -> [String] {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Usuario")
        
        do {
            let usuario = try managedContext.fetch(fetchRequest)
            
            if usuario.count > 0 {
                let userName = usuario[0].value(forKey: "usuario") as! String
                let userPassword = usuario[0].value(forKey: "senha") as! String
                
                return [userName, userPassword]
            }
            
            return [""]
            
        } catch let error as NSError {
            print("Dados não encontrados \(error), \(error.userInfo)")
            return [""]
        }
    }
    
    func logOut() {
        limpaEntities(entity: "Usuario")
    }
}

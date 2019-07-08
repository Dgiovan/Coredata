//
//  ValidateSessionViewController.swift
//  CoreDatWithSession
//
//  Created by Josue J Maqueda Flores on 5/11/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//

import UIKit
import CoreData

class ValidateSessionViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        //
        validateIfUserActivated()
    }
    
    private func validateIfUserActivated()
    {
        if let user = PersistenceService.getUser()
        {
            //TODO: Ir a vista principal
            print("Ir a vista principal")
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "homeSegue", sender: nil)
            }
        }
        else
        {
            //TODO: Ir a vista de crear usuario o login
            print("Ir a seccion de registrar o iniciar sesion de usuario")
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "registerSegue", sender: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

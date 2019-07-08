//
//  RegisterViewController.swift
//  CoreDatWithSession
//
//  Created by Josue J Maqueda Flores on 5/11/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController
{
    
    @IBOutlet weak var usuarioField: UITextField!
    @IBOutlet weak var nombreField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("cargaste la vista")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveUserButton(_ sender: UIButton)
    {
        let usuario = usuarioField.text
        let nombre = nombreField.text
        let pass = passField.text
        //
        let user = Usuarios(context: PersistenceService.context)
        user.usuario = usuario
        user.nombre = nombre
        user.contrasenia = pass
        user.estaActivo = true
        //
        if PersistenceService.saveContext()
        {
            let alerta = UIAlertController(title: "Alerta", message: "Usuario guardado de manera correcta", preferredStyle: .alert)
            let action = UIAlertAction(title: "Aceptar", style: .default) { (alerta) in
                self.dismiss(animated: true, completion: nil)
            }
            alerta.addAction(action)
            self.present(alerta, animated: true, completion: nil)
        }
        else
        {
            let alerta = UIAlertController(title: "Error", message: "Fallo al intentar guardar usuario", preferredStyle: .alert)
            let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            alerta.addAction(action)
            self.present(alerta, animated: true, completion: nil)
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

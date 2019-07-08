//
//  HomeViewController.swift
//  CoreDatWithSession
//
//  Created by Josue J Maqueda Flores on 5/11/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableVIew: UITableView!
    
    var usuarios:[Usuarios] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
        self.initSetup()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        loadDataUsers()
    }
    
    private func loadDataUsers()
    {
        let fetchRequest:NSFetchRequest<Usuarios> = Usuarios.fetchRequest()
        usuarios.removeAll()
        do {
            let list = try PersistenceService.context.fetch(fetchRequest)
            self.usuarios = list
            self.tableVIew.reloadData()
        } catch {
            print("No hay usuarios")
        }
    }
    
    private func initSetup()
    {
        tableVIew.delegate = self
        tableVIew.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableVIew.dequeueReusableCell(withIdentifier: "userId", for: indexPath) as! UsuarioTableViewCell
        let usuario = usuarios[indexPath.row]
        cell.usuarioLbl.text = usuario.nombre
        //
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
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

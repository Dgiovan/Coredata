//
//  PersistenceService.swift
//  CoreDatWithSession
//
//  Created by Josue J Maqueda Flores on 5/11/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//

import Foundation
import CoreData

class PersistenceService
{
    private init() {}
    
    static var context:NSManagedObjectContext
    {
        return persistenceContainer.viewContext
    }
    
    static var persistenceContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDatWithSession")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError?
            {
                fatalError("Error al cargar el modelo de datos: \(error)")
            }
        })
        return container
    }()
    
    static func saveContext() -> Bool
    {
        let context = persistenceContainer.viewContext
        //
        if context.hasChanges
        {
            do {
                try context.save()
                return true
            } catch {
                return false
            }
        }
        //
        return false
    }
    //
    
    static func getUser() -> Usuarios?
    {
        let context = persistenceContainer.viewContext
        //
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        fetchRequest.predicate = NSPredicate(format: "estaActivo = true")
        //
        do {
            let resultado = try? context.fetch(fetchRequest)
            //
            if let data = resultado as? [Usuarios]
            {
                if !data.isEmpty
                {
                    return data.first
                }
            }
            return nil
        }
    }
}

//
//  Usuarios+CoreDataProperties.swift
//  CoreDatWithSession
//
//  Created by Josue J Maqueda Flores on 5/11/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//
//

import Foundation
import CoreData


extension Usuarios {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuarios> {
        return NSFetchRequest<Usuarios>(entityName: "Usuarios")
    }

    @NSManaged public var usuario: String?
    @NSManaged public var nombre: String?
    @NSManaged public var contrasenia: String?
    @NSManaged public var estaActivo: Bool

}

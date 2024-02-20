//
//  File.swift
//  
//
//  Created by Afrah Saleh on 10/08/1445 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateProduct: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("Productes") //create table
            .id()
            .field("name" , .string, .required)
            .field("description" , .string)
            .field("price" , .double, .required)
            .field("quantity_in_stock", .int, .required)
            .create()
    }
    
    //undo
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("Products").delete() //delete table
    }
    
    
}

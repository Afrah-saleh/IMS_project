//
//  File.swift
//  
//
//  Created by Afrah Saleh on 10/08/1445 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateCustomers: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("Customer") //create table
            .id()
            .field("name" , .string)
            .field("email" , .string)
            .field("address" , .string)
            .field("phone_number" , .string)
            .create()
    }
    
    //undo
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("Customer").delete() //delete table
    }
    
    
}

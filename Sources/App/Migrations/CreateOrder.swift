//
//  File.swift
//  
//
//  Created by Afrah Saleh on 10/08/1445 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateOrder: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("Orders") //create table
            .id()
        //set up the foreign key constraints for these relationships:
            .field("customer_id", .uuid, .required , .references("Customer", "id"))
             .field("product_id", .uuid, .required, .references("Productes", "id"))
            .field("order_date" , .date)
            .field("status" , .string)
            .field("quantity_ordered" , .int, .required)
            .create()
    }
    
    //undo
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("Orders").delete() //delete table
    }
    
    
}


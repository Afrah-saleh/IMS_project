//
//  File.swift
//  
//
//  Created by Afrah Saleh on 10/08/1445 AH.
//

import Foundation
import Vapor
import Fluent

final class Customer: Model, Content {
    // Name of the table or collection.
    static let schema = "Customer"

    // Unique identifier for this customer.
    @ID(key: .id)
    var id: UUID?

    // The customer's name.
    @Field(key: "name")
    var name: String

    @Field(key: "email")
    var email: String

    @Field(key: "address")
    var address: String

    @Field(key: "phone_number")
    var phone_number: String

    // Creates a new, empty customer.
    init() { }
    // Customer should have a one-to-many relationship with Orders, as one customer can have many orders.
    @Children(for: \.$customer_id)
    var orders: [Order]
    
    // Creates a new customer with all properties set.
    init(id: UUID? = nil, name: String, email: String, address: String, phone_number: String) {
        self.id = id
        self.name = name
        self.email = email
        self.address = address
        self.phone_number = phone_number
    }
}

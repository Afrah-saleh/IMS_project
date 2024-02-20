//
//  File.swift
//  
//
//  Created by Afrah Saleh on 10/08/1445 AH.
//

import Foundation
import Vapor
import Fluent

final class Order: Model, Content {
    static let schema = "Orders"

    @ID(key: .id)
    var id: UUID?

    // Define a many-to-one relationship to Customers
    @Parent(key: "customer_id")
    var customer_id: Customer

    // Define a many-to-one relationship to Products
    @Parent(key: "product_id")
    var product_id: Product

    @Field(key: "order_date")
    var order_date: Date

    @Field(key: "status")
    var status: String

    @Field(key: "quantity_ordered")
    var quantity_ordered: Int

    init() {}

    // Additional initializer to set properties when creating a new Order
    init(id: UUID? = nil, customer_id: UUID, product_id: UUID, order_date: Date, status: String, quantity_ordered: Int) {
        self.id = id
        self.customer_id.id = customer_id
        self.product_id.id = product_id
        self.order_date = order_date
        self.status = status
        self.quantity_ordered = quantity_ordered
    }
}


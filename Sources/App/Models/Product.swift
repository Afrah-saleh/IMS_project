//
//  File.swift
//  
//
//  Created by Afrah Saleh on 10/08/1445 AH.
//

import Foundation
import Foundation
import Vapor
import Fluent

final class Product: Model, Content {
    // Name of the table or collection.
    static let schema = "Productes"

    // Unique identifier for this product.
    @ID(key: .id)
    var id: UUID?

    // The product's name.
    @Field(key: "name")
    var name: String

    @Field(key: "description")
    var description: String

    @Field(key: "price")
    var price: Double

    @Field(key: "quantity_in_stock")
    var quantity_in_stock: Int

    // Creates a new, empty product.
    init() { }
    //    // Product should have a one-to-many relationship with Orders, as one product can be associated with many orders.
        @Children(for: \.$product_id)
        var orders: [Order]
    

    // Creates a new product with all properties set.
    init(id: UUID? = nil, name: String, description: String, price: Double, quantity_in_stock: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.quantity_in_stock = quantity_in_stock
    }
}

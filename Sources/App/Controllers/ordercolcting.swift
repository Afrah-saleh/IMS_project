//
//  File.swift
//  
//
//  Created by Afrah Saleh on 10/08/1445 AH.
//

import Foundation
import Vapor
struct ordercolcting : RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        
        //http://127.0.0.1:8080/orders
        let Orders = routes.grouped("Orders")
        
        Orders.get( use: getAllOrders)
        Orders.post( use: createNewOrder)
        Orders.put(":id", use: updateOrder)
        Orders.delete(":id", use: deleteOrder)
        Orders.get(":id", use: getOneOrder)
    }
    
    func getAllOrders (req  :  Request) async throws -> [Order] {
        let order = try await Order.query(on: req.db).all()
        return order
    }

    func createNewOrder(req: Request) async throws -> Order {
        let order = try req.content.decode(Order.self)
        
        // Fetch the product
        guard let product = try await Product.find(order.$product_id.id, on: req.db) else {
            throw Abort(.notFound, reason: "Product not found")
        }
        
        // Check if there's enough quantity in stock
        if product.quantity_in_stock < order.quantity_ordered {
            throw Abort(.badRequest, reason: "Not enough quantity in stock")
        }
        
        // Reduce the quantity in stock
        product.quantity_in_stock -= order.quantity_ordered
        
        // Save both the order and the updated product
        try await order.save(on: req.db)
        try await product.save(on: req.db)
        
        return order
    }
    

    func updateOrder(req: Request) async throws -> Order {
        
        guard let order = try await Order.find(req.parameters.get("id"), on: req.db) else {
            print("test1")
            throw Abort(.notFound)
        }
        
        do {
            let updatedOrder = try req.content.decode(Order.self)
            
            // Fetch the product
            guard let product = try await Product.find(order.$product_id.id, on: req.db) else {
                print("test1")
                
                throw Abort(.notFound, reason: "Product not found")
            }
            
            // Calculate the difference in ordered quantity
              let quantityDifference = updatedOrder.quantity_ordered - order.quantity_ordered
            
                    // Ensure there's enough quantity in stock for the update
                    if product.quantity_in_stock < quantityDifference {
                        throw Abort(.badRequest, reason: "Not enough quantity in stock to fulfill the updated order")
                    }
            
            // Update the quantity in stock
              product.quantity_in_stock -= quantityDifference
            
            // Update the order
                //    order.customer_id = updatedOrder.customer_id
                //   order.product_id = updatedOrder.product_id
               //   order.order_date = updatedOrder.order_date
                 order.status = updatedOrder.status
            order.quantity_ordered = updatedOrder.quantity_ordered
            
            // Save both the updated order and the product
            try await order.save(on: req.db)
            try await product.save(on: req.db)
            
        }
        catch let error {
            print(error)
            
        }
        return order
    }

    func deleteOrder(req: Request) async throws -> HTTPStatus {
        guard let order = try await Order.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        // Fetch the product
        guard let product = try await Product.find(order.$product_id.id, on: req.db) else {
            throw Abort(.notFound, reason: "Product not found")
        }
        
        // Increase the quantity in stock
        product.quantity_in_stock += order.quantity_ordered
        
        // Save the updated product and delete the order
        try await product.save(on: req.db)
        try await order.delete(on: req.db)
        
        return .ok
    }
    
    func getOneOrder (req : Request) async throws -> Order {
        guard let order = try await Order.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return order
    }
    
    
}



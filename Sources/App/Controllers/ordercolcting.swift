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

    func createNewOrder (req : Request) async throws -> Order{
        let order = try req.content.decode(Order.self)
        try await order.save(on: req.db)
            return order
    }
    

    func updateOrder (req : Request)  async throws -> Order {
        guard let order = try await Order.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        let updatedorder = try req.content.decode(Order.self)
        
        order.customer_id = updatedorder.customer_id
        order.product_id = updatedorder.product_id
        order.order_date = updatedorder.order_date
        order.status = updatedorder.status
        order.quantity_ordered = updatedorder.quantity_ordered
  
        try await order.save(on: req.db)
        return order
    }

    func deleteOrder (req : Request) async throws -> Order {
        guard let order = try await Order.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        try await order.delete(on: req.db)
        return order
    }
    
    func getOneOrder (req : Request) async throws -> Order {
        guard let order = try await Order.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return order
    }
    
    
}



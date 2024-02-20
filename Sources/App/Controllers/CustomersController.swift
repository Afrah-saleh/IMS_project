//
//  File.swift
//  
//
//  Created by Afrah Saleh on 10/08/1445 AH.
//

import Foundation
import Vapor

struct CustomersController : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        //http://127.0.0.1:8080/customers
        let customers = routes.grouped("Customer") //create group route for customers
        
        customers.get(use : getAllCustomers) //use the group with get all customers
        
        customers.post(use: createNewCustomer) //use to create new customer
        
        customers.put(":id", use : updateCustomer) //use to update customer
        
        customers.delete(":id", use: deleteCustomer) //delete customer
        
        customers.get(":id", use: getOneCustomer) //view one customer
    }
    
    

    func getAllCustomers (req  :  Request) async throws -> [Customer] {
        let customers = try await Customer.query(on: req.db).all()
        return customers
    }

    func createNewCustomer (req : Request) async throws -> Customer{
        let customers = try req.content.decode(Customer.self)
        try await customers.save(on: req.db)
            return customers
    }
    

    func updateCustomer (req : Request)  async throws -> Customer {
        guard let customers = try await Customer.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        let updatedCustomer = try req.content.decode(Customer.self)
        
        customers.name = updatedCustomer.name
        customers.email = updatedCustomer.email
        customers.address = updatedCustomer.address
        customers.phone_number = updatedCustomer.phone_number
        try await customers.save(on: req.db)
        return customers
    }

    func deleteCustomer (req : Request) async throws -> Customer {
        guard let customers = try await Customer.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        try await customers.delete(on: req.db)
        return customers
    }
    
    func getOneCustomer (req : Request) async throws -> Customer {
        guard let customers = try await Customer.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return customers
    }
    
    
}

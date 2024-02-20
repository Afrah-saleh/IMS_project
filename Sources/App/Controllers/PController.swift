//
//  File.swift
//  
//
//  Created by Afrah Saleh on 10/08/1445 AH.
//

import Foundation
import Vapor

struct PController : RouteCollection{
    func boot(routes: RoutesBuilder) throws {
       
        //http://127.0.0.1:8080/Productes
        let Productes = routes.grouped("Productes")
        
        //get
        Productes.get(use : getAllProducts)
        
        //create or post
        Productes.post(use : createNewProduct)
        
        //update or put
        Productes.put(":id" , use : updateProduct)
        
        //delete
        Productes.delete(":id" , use : deleteProduct)
        
        //get one producte
        Productes.get(":id" , use : getOneProduct)
    }
    
    func getAllProducts (req  :  Request) async throws -> [Product] {
        let product = try await Product.query(on: req.db).all()
        return product
    }

    func createNewProduct (req : Request) async throws -> Product{
        let product = try req.content.decode(Product.self)
        try await product.save(on: req.db)
            return product
    }
    

    func updateProduct (req : Request)  async throws -> Product {
        guard let product = try await Product.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        let updatedProduct = try req.content.decode(Product.self)
        
        product.name = updatedProduct.name
        product.description = updatedProduct.description
        product.price = updatedProduct.price
        product.quantity_in_stock = updatedProduct.quantity_in_stock
  
        
        try await product.save(on: req.db)
        return product
    }

    func deleteProduct (req : Request) async throws -> Product {
        guard let product = try await Product.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        try await product.delete(on: req.db)
        return product
    }
    
    func getOneProduct (req : Request) async throws -> Product {
        guard let product = try await Product.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return product
    }
    
    
}

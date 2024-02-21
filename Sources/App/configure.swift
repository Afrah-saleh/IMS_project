import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(configuration: SQLPostgresConfiguration(
        hostname: "localhost",
        username: "postgres",
        password: "",
        database: "ims",
        tls: .prefer(try .init(configuration: .clientDefault)))) ,
                      as: .psql)
    app.migrations.add(CreateCustomers())
    app.migrations.add(CreateOrder())
    app.migrations.add(CreateProduct())
    

    // register routes
    try app .register(collection: ordercolcting())
    try app.register(collection: PController())
    try app.register(collection: CustomersController()) //register customer

    try routes(app)
}

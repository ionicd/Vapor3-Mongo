import MongoSwift
import Vapor

public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    // Register providers first
   let client = try MongoClient("mongodb+srv://login:login1234@login-kvijo.mongodb.net/test?retryWrites=true&w=majority");
// MongoClient("")
let db = client.db("vaporapp")
do {
  _ = try db.createCollection("users")
} catch {
  _ = db.collection("users")
}
services.register(client)
    
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
}

extension MongoClient: Service {}

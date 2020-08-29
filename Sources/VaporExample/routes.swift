import Vapor
import MongoSwift

// User Model
struct User: Content {
  var id: Int
  var username: String?
  var password: String?
}

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

router.get("users") { req -> [String] in
    let client = try! req.make(MongoClient.self)
    let collection = client.db("vaporapp").collection("users", withType: User.self)
    let cursor = try! collection.find()
    var usernames = [String]()
    for document in cursor {
        if let username = document.username {
            usernames.append(username)
        }
    }
    return usernames
}

   router.post("user") { req -> Future<HTTPStatus> in
    return try req.content.decode(User.self).map(to: HTTPStatus.self) { user in

        let client = try! req.make(MongoClient.self)
        let collection = client.db("vaporapp").collection("users", withType: User.self)
        _ = try! collection.insertOne(user)
        return HTTPStatus.ok
    }
}
}

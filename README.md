# VaporExample

This is a minimal working example of using the driver in a Vapor application.

**Note**: The driver depends on Mongodb and the guide is compatible with Vapor3.<br>
Guide: [Server-side Swift: how to use Vapor 3 with MongoDB](https://medium.com/@volodymyrklymenko/server-side-swift-how-to-use-vapor-3-with-mongodb-baf9b79c8d0)

To test it out, do the following:
1. Run `mongod` to start MongoDB running on `localhost:27017` or configure your own server in Atlas.
1. Navigate to the `Sources/VaporExample/` directory for app files. ( It is where the application files are configured/ loaded) 
1. Navigate to the root directory.
1. Run `swift build` on the /VaporEx to initiate the build.(`vapor3 build` is also recommended)
1. Run `vapor3 run` and the terminal shows that app runs on `localhost:8080`.
1. Navigate to `localhost:8080/kittens` to see the example data loaded on the web page. (This example also has \users endpoint)

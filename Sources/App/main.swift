
import Vapor
import VaporMySQL

let drop = Droplet()
try drop.addProvider(VaporMySQL.Provider.self)

drop.post("pug") { request in
    
    guard let imageURL = request.data["imageurl"]?.string else {
        throw Abort.badRequest
    }
    
    return imageURL
}

drop.get("pug") { request in
    
    let pug = Pug(imageURL: "image.png")
    
    return try! pug.makeJSON()
}

drop.run()

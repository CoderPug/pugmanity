
import Vapor
import VaporMySQL

let drop = Droplet()
try drop.addProvider(VaporMySQL.Provider.self)
drop.preparations.append(Pug.self)

drop.post("pug") { request in
    
    guard let imageURL = request.data["imageurl"]?.string else {
        throw Abort.badRequest
    }
    
    var pug = Pug(imageURL: imageURL)
    
    try pug.save()
    
    return pug
}

drop.get("pug") { request in
    
    return try JSON(node: Pug.all())
}

drop.run()

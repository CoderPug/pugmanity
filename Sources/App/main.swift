import Vapor

let drop = Droplet()

drop.post("pug") { request in
    
    guard let imageURL = request.data["imageurl"]?.string else {
        throw Abort.badRequest
    }
    
    return imageURL
}

drop.run()

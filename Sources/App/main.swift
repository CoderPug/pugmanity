
import Vapor
import VaporMySQL

let drop = Droplet()
try drop.addProvider(VaporMySQL.Provider.self)
drop.preparations.append(Pug.self)

drop.post("pug") { request in
    
    guard let title = request.data["title"]?.string,
        let imageURL = request.data["imageurl"]?.string else {
        throw Abort.badRequest
    }
    
    let description = request.data["description"]?.string
    
    var pug = Pug(title: title, description: description, imageURL: imageURL)
    
    try pug.save()
    
    return pug
}

drop.put("pug", Int.self) { request, pugId in
    
    guard let title = request.data["title"]?.string,
        let imageURL = request.data["imageurl"]?.string else {
            throw Abort.badRequest
    }
    
    let description = request.data["description"]?.string
    
    var pug: Pug?
    
    do {
        pug = try Pug.find(pugId)
    }
    catch {
        throw Abort.serverError
    }
    
    if pug != nil {
        pug?.update(title: title, description: description, imageURL: imageURL)
        try pug?.save()
    }
    
    return pug ?? Pug()
}

drop.get("pug") { request in
    
    return try JSON(node: Pug.all())
}

drop.get { request in
    
    var pugs = [Pug]()
    
    do {
        pugs = try Pug.all()
    }
    catch {
        throw Abort.serverError
    }
    
    return try drop.view.make("welcome2", ["pugs": pugs.makeNode()])
}

drop.run()

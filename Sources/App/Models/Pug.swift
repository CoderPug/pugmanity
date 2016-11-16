//
//  Pug.swift
//  pugmanity
//
//  Created by Santex on 11/15/16.
//
//

import Vapor
import FluentMySQL

final class Pug : Model {
    
    var id: Node?
    var title: String
    var description: String
    var imageURL: String
    
    init(title: String, description: String?, imageURL: String) {
        
        self.title = title
        self.description = description ?? ""
        self.imageURL = imageURL
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        title = try node.extract("title")
        description = try node.extract("description")
        imageURL = try node.extract("imageurl")
    }
    
    convenience init() {
        
        self.init(title: "", description: nil, imageURL: "")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
                "id": id,
                "title": title,
                "description": description,
            "imageurl": imageURL
            ])
    }
    
    static func prepare(_ database: Database) throws {
        
        try database.create("pugs") { pugs in
            pugs.id()
            pugs.string("title")
            pugs.string("description")
            pugs.string("imageurl")
        }
    }
    
    static func revert(_ database: Database) throws {
        
        try database.delete("pugs")
    }

    func update(title: String, description: String?, imageURL: String) {
    
        self.title = title
        self.description = description ?? ""
        self.imageURL = imageURL
    }
    
}

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
    var imageURL: String
    
    init(imageURL: String) {
        
        self.imageURL = imageURL
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        imageURL = try node.extract("imageurl")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
                "id": id,
                "imageurl": imageURL
            ])
    }
    
    static func prepare(_ database: Database) throws {
        
        try database.create("pugs") { pugs in
            pugs.id()
            pugs.string("imageurl")
        }
    }
    
    static func revert(_ database: Database) throws {
        
        try database.delete("pugs")
    }

}

//
//  Pug.swift
//  pugmanity
//
//  Created by Santex on 11/15/16.
//
//

import Vapor

final class Pug : JSONRepresentable {
    
    var id: Node?
    var imageURL: String
    
    init(imageURL: String) {
        
        self.imageURL = imageURL
    }

    func makeJSON() throws -> JSON {
     
        return JSON([
            "id": id ?? "",
            "imageurl": Node(imageURL)
            ])
    }
}

//
//  ArtistModel.swift
//  BINetworkLayer
//
//  Created by Britto on 5/1/18.
//  Copyright © 2018 Britto. All rights reserved.
//

import Foundation

struct Artist {
    let id: Int
    let imagePath: String
    let name: String
}

extension Artist: Decodable {
    
    enum MovieCodingKeys: String, CodingKey {
        case id
        case imagePath = "imagePath"
        case name = "name"
    }
    
    
    init(from decoder: Decoder) throws {
        let movieContainer = try decoder.container(keyedBy: MovieCodingKeys.self)
        
        id = try movieContainer.decode(Int.self, forKey: .id)
        imagePath = try movieContainer.decode(String.self, forKey: .imagePath)
        name = try movieContainer.decode(String.self, forKey: .name)
    }
}

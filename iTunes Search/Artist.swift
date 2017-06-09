//
//  Artist.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/5/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation


class Artist{
    var _id: Int
    var _name: String
    var _primaryGenre: Genre
    var _album: [Album]
    
    
    
    init(id: Int, name: String, genre: Genre, album: [Album]){
        _id             = id
        _name           = name
        _primaryGenre   = genre
        _album          = album
    }
}



extension Artist {
    convenience init?(json: [String: Any]) {
        
        struct Key {
            static let artistName = "artistName"
            static let artistId = "artistId"
            static let primaryGenreId = "primaryGenreId"
        }
        
        guard let artistName = json[Key.artistName] as? String,
            let artistId = json[Key.artistId] as? Int,
            let primaryGenreId = json[Key.primaryGenreId] as? Int,
            let primaryGenreValue = Genre(rawValue: primaryGenreId) else {
                return nil
        }
        
        self.init(id: artistId, name: artistName, genre: primaryGenreValue, album: [])
    }
}

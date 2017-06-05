//
//  Artist.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/5/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation


class Artist{
    let _id: Int
    let _name: String
    let _primaryGenre: Genre
    let _album: [Album]
    
    
    
    init(id: Int, name: String, genre: Genre, album: [Album]){
        _id             = id
        _name           = name
        _primaryGenre   = genre
        _album          = album
    }
}

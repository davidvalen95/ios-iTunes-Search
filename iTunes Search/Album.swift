//
//  Album.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/5/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation


class Album{

    let _id: Int
    let _artistName: String
    let _name: String
    let _censoredName: String
    let _artworkUrl: String
    let _isExplicit: Bool
    let _numberOfTracks: Int
    let _releaseDate: Date
    let _primaryGenre: Genre
    var songs = [Song]()

    
    init(id: Int, artistName: String, name: String, censoredName:String, artworkUrl: String, isExplicit: Bool, numberOfTracks: Int, releaseDate: Date, primaryGenre: Genre) {
        _id = id
        _artistName = artistName
        _name = name
        _censoredName = censoredName
        _artworkUrl = artworkUrl
        _isExplicit = isExplicit
        _numberOfTracks = numberOfTracks
        _releaseDate = releaseDate
        _primaryGenre = primaryGenre
        //https://itunes.apple.com/lookup?id=
    }
}

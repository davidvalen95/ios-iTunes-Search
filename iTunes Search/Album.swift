//
//  Album.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/5/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation
import UIKit


enum AlbumArtworkState{
    case placeholder
    case downloaded
    case failed
}

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
    var artWork: UIImage?
    var artWorkState = AlbumArtworkState.placeholder
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


extension Album {
    convenience init?(json: [String: Any]) {
        
        struct Key {
            static let id = "collectionId"
            static let artistName = "artistName"
            static let name = "collectionName"
            static let censoredName = "collectionCensoredName"
            static let artworkUrl = "artworkUrl100"
            static let collectionExplicitness = "collectionExplicitness"
            static let trackCount = "trackCount"
            static let releaseDate = "releaseDate"
            static let primaryGenre = "primaryGenreName"
        }
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        guard let idValue = json[Key.id] as? Int,
            let artistNameValue = json[Key.artistName] as? String,
            let nameValue = json[Key.name] as? String,
            let censoredNameValue = json[Key.censoredName] as? String,
            let artworkUrlString = json[Key.artworkUrl] as? String,
            let isExplicitValue = json[Key.collectionExplicitness] as? String,
            let numberOfTracksValue = json[Key.trackCount] as? Int,
            let releaseDateString = json[Key.releaseDate] as? String,
            let releaseDateValue = formatter.date(from: releaseDateString),
            let primaryGenreString = json[Key.primaryGenre] as? String,
            let primaryGenreValue = Genre(name: primaryGenreString) else { return nil }
        
        let isExplicit = isExplicitValue == "notExplicit" ? false : true
        
        self.init(id: idValue, artistName: artistNameValue, name: nameValue, censoredName: censoredNameValue, artworkUrl: artworkUrlString, isExplicit: isExplicit, numberOfTracks: numberOfTracksValue, releaseDate: releaseDateValue, primaryGenre: primaryGenreValue)
    }
    
    
}

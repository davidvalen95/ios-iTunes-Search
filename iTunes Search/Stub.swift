//
//  Stub.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/5/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation


struct Stub {
    static var artist: Artist {
        return Artist(id: 159260351, name: "Taylor Swift", genre: .pop, album: [])
    }
    
    static var albums: [Album] {
        let eightyNine = Album(id: 907242701, artistName: "Taylor Swift", name: "1989", censoredName: "1989", artworkUrl: "http://is2.mzstatic.com/image/thumb/Music5/v4/29/fa/b6/29fab67f-c950-826f-26a0-5eebcd0e262b/source/100x100bb.jpg", isExplicit: false, numberOfTracks: 14, releaseDate: Date(), primaryGenre: .pop)
        let red = Album(id: 571445253, artistName: "Taylor Swift", name: "Red", censoredName: "Red", artworkUrl: "http://is4.mzstatic.com/image/thumb/Music/v4/11/b7/3f/11b73fb0-46af-42b5-111a-6bce1815562f/source/100x100bb.jpg", isExplicit: false, numberOfTracks: 16, releaseDate: Date(), primaryGenre: .country)
        
        return [eightyNine, red]
    }
    
    static var songs: [Song] {
        
        let welcomeToNY = Song(_id: 907242702, _name: "Welcome To New York", _censoreName: "Welcome To New York", _trackTime: 212600, _isExplicit: false)
        let blankSpace =  Song(_id: 907242703, _name: "Blank Space", _censoreName: "Blank Space", _trackTime: 231833, _isExplicit: false)
        
        return [welcomeToNY, blankSpace]
    }
}

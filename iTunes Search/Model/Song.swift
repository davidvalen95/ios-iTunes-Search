extension Song {
    init?(json: [String: Any]) {
        
        struct Key {
            static let id = "trackId"
            static let name = "trackName"
            static let censoredName = "trackCensoredName"
            static let trackTime = "trackTimeMillis"
            static let isExplicit = "trackExplicitness"
        }
        
        guard let idValue = json[Key.id] as? Int,
            let nameValue = json[Key.name] as? String,
            let censoredNameValue = json[Key.censoredName] as? String,
            let trackTimeValue = json[Key.trackTime] as? Int,
            let isExplicitString = json[Key.isExplicit] as? String else {
                return nil
        }
        
        self._id = idValue
        self._name = nameValue
        self._censoreName = censoredNameValue
        self._trackTime = trackTimeValue
        self._isExplicit = isExplicitString == "notExplicit" ? false : true
    }
}//
//  Song.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/5/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation


struct Song{
    let _id: Int
    let _name: String
    let _censoreName: String
    let _trackTime: Int
    let _isExplicit: Bool
    
    
}

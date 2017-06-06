//
//  AlbumCellViewModel.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation


struct AlbumCellViewmodel{
    let _title:String
    let _releaseDate: String
    let _genre: String
    
}

extension AlbumCellViewmodel{
    init(album:Album){
        _title = album._censoredName
        _genre = album._primaryGenre.name
        
        let formater: DateFormatter = DateFormatter()
        
        formater.locale = Locale.current
        formater.dateFormat = "dd MM yyy"
        
        _releaseDate = formater.string(from: album._releaseDate)
    }
}

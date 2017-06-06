//
//  SongViewModel.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation


struct SongViewModel{
    let _title: String
    let _runTime: String
    
    
}

extension SongViewModel{
    init (song:Song){
        _title = song._censoreName
        
        let timeInSeconds = song._trackTime / 1000
        let timeInMinute = timeInSeconds / 60 % 60
        let timeInSecond = timeInMinute % 60
        
        
        _runTime = "\(timeInMinute):\(timeInSecond)"
    }
}

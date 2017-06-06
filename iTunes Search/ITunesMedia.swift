//
//  ITunesMedia.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation

enum ItunesMedia {
    case movie
    case podcast
    case music
    case musicVideo
    case audiobook
    case shortFilm
    case tvShow
    case software
    case ebook
    case all
}

extension ItunesMedia: CustomStringConvertible {
    var description: String {
        switch self {
        case .movie: return "movie"
        case .podcast: return "podcast"
        case .music: return "music"
        case .musicVideo: return "musicVideo"
        case .audiobook: return "audiobook"
        case .shortFilm: return "shortFilm"
        case .tvShow: return "tvShow"
        case .software: return "software"
        case .ebook: return "ebook"
        case .all: return "all"
        }
    }
}

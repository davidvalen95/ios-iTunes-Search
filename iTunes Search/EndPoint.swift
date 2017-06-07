//
//  EndPoint.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation


protocol EndPoint{
    var _base:String{get}
    var _path:String{get}
    
    var _queryItems:[URLQueryItem]{get}
}
extension EndPoint{
    var _urlComponents: URLComponents{
        get{
            var components = URLComponents(string: _base)!
            components.path = _path
            components.queryItems = _queryItems
            return components
        }
        set(newValue){
            _urlComponents = newValue
        }
    }
    var _request: URLRequest{
        let url = _urlComponents.url
        return URLRequest(url: url!)
    }
}
enum ITunes{
    case search(term:String, mediaType: ItunesMedia?)
    case lookup(id:Int, entity: ItunesEntity?)
}
extension ITunes: EndPoint{
    var _base:String { return "https://itunes.apple.com"}
    
    var _path: String{
        switch self{
            
        case .search: return "/search"
            
        case .lookup:return "/lookup"
            
            
            
        }
    }
    var _queryItems:[URLQueryItem]{
        get{
            switch self{
            case .search(term: let term, mediaType: let media):
                var result = [URLQueryItem]()
                let searchTermItem = URLQueryItem(name: "term", value: term)
                result.append(searchTermItem)
                if let media = media{
                    let mediaItem = URLQueryItem(name: "media", value: media.description)
                    result.append(mediaItem)
                    
                    if let entityQueryItem = media.entityQueryItem{
                        result.append(entityQueryItem)
                    }
                    
                    if let attribureQueryItem = media.attributeQueryItem{
                        result.append(attribureQueryItem)
                    }
                }
                
                return result
            case.lookup(id: let id, entity: let entity):
                return [
                    URLQueryItem(name: "id", value: id.description),
                    URLQueryItem(name: "entity", value: entity?.entityName)
                ]
            }
        }
    }
}

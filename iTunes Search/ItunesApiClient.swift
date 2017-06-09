//
//  ItunesApiClient.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/8/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation

class ItunesAPiClient{
    
    
    let downloader = JSONDownloader()
    
    func searchForArtist(term: String, completion: @escaping([Artist], ItunesError?)->Void ){
        let endPoint = ITunes.search(term: term, mediaType: ItunesMedia.music(entity:  MusicEntity.musicArtist, attribute: .artistTerm))
        
        self.performRequest(endPoint: endPoint){results, error in
            guard let results = results else{
                completion([],error)
                return
            }
            let artists = results.flatMap{Artist(json: $0)}
            completion(artists,nil)
        }
    
    }
    
    
    
    
    
    
    func lookUpArtist(id: Int, completion: @escaping (Artist?, ItunesError?) -> Void){
        let endPoint = ITunes.lookup(id: id, entity: MusicEntity.album)
        self.performRequest(endPoint: endPoint){results, error in
            guard let results = results else{
                completion(nil,error)
                return
            }
            
            guard let artistInfo = results.first else{
                completion(nil,.jsonParsingFailure(message: "doesnot contain artist info"))
                return
            }
            
            guard let artist = Artist(json: artistInfo) else{
                completion(nil,.jsonParsingFailure(message: "no artist"))
                return
            }
            
            let albumResults = results[1..<results.count]
            
            let albums = albumResults.flatMap{Album(json: $0)}
                artist._album = albums
            
            completion(artist,nil)
        }//closure
    }
        
    
    
    func lookUpAlbum(id: Int, completion: @escaping (Album?, ItunesError?) -> Void){
        let endPoint = ITunes.lookup(id: id, entity: MusicEntity.song)
        self.performRequest(endPoint: endPoint){results, error in
            guard let results = results else{
                completion(nil,error)
                return
            }
            
            guard let albumInfo = results.first else{
                completion(nil,.jsonParsingFailure(message: "doesnot contain album info"))
                return
            }
            
            guard let album = Album(json: albumInfo) else{
                completion(nil,.jsonParsingFailure(message: "no album"))
                return
            }
            
            let songResults = results[1..<results.count]
            
            let songs = songResults.flatMap{Song(json: $0)}
            album.songs = songs
            
            completion(album,nil)
        }//closure
    }
    
    

    
    
    
    
    
    
    
    
    typealias Results = [[String:Any]]
        
        
    func performRequest(endPoint: EndPoint, completion: @escaping (Results?, ItunesError?) -> Void  ){
        let task = downloader.jsonTask(with: endPoint._request){ json, error in
            DispatchQueue.main.async {
                guard let json = json else{
                    completion(nil,error)
                    return
                }//guard
                guard let results = json["results"] as? [[String:Any]]else{
                    completion(nil,.jsonParsingFailure(message: "json data does not contain result"))
                    return
                }//guard results
                completion(results,nil)
            }
            
            
            
        }//task closure
        
        task.resume()
    }
}

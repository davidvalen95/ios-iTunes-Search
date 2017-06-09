//
//  ArtworkDownloader.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/9/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation

import UIKit
class ArtworkDownloader:Operation{
    
    var album: Album
    
    init(album: Album){
        self.album = album
        super.init()
        
    }
    
    
    
    override func main() {
        if super.isCancelled{
            return
        }
        
        guard let url = URL(string: album._artworkUrl) else{
            return
        }
        let imageData = try! Data(contentsOf: url)
        
        
        if super.isCancelled{
            return
        }
        if imageData.count > 0 {
            album.artWork = UIImage(data: imageData)
            album.artWorkState = .downloaded
        }else{
            album.artWorkState = .failed
            
        }
        
    }

    
    
}

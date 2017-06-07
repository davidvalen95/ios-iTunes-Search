//
//  ViewController.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/3/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let searchEndpoint = ITunes.search(term: "taylor swift", mediaType: ItunesMedia.music(entity: .musicArtist, attribute: .artistTerm))
        print(searchEndpoint)
        let lookEndPoint  = ITunes.lookup(id: 15926031, entity: MusicEntity.album)
        print(lookEndPoint)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


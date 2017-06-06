//
//  ResultDataSource.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit

class ResultDataSource: NSObject, UITableViewDataSource {

    var _data:[Artist] = [Artist]()
    
    override init(){
        super.init()
        
    }
    
    
    func updateArtist(artists: [Artist]){
        _data = artists
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let artist = _data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        cell.textLabel?.text = artist._name
        
        return cell
    }
    
    //MARK: - Helper Method
    
    public func getArtist(at indexPath: IndexPath) -> Artist{
        return _data[indexPath.row]
    }
}

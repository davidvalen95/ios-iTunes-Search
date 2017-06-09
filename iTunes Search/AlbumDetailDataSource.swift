//
//  AlbumDetailDataSource.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailDataSource: NSObject, UITableViewDataSource{
    
    private var _songs:[Song]
    init(songs:[Song]){
        _songs = songs
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _songs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SongTableViewCell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.ReuseIdentifier, for: indexPath) as! SongTableViewCell
        
        let song = _songs[indexPath.row]
        let viewModel = SongViewModel(song: song)
        cell.configureView(songViewModel: viewModel)
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Tracks"
            
        default: return nil
        }
    }
    
    func update(songs: [Song]){
        self._songs = songs
    }
}

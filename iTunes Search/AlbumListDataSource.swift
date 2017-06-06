//
//  AlbumListDataSource.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {
    
    private var _albums: [Album] = []
    
    override init(){
        super.init()
        
    }
    
    
    
    convenience init(albums:[Album]){
        self.init()
        _albums = albums
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: AlbumTableViewCell! = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.reuseIdentifier, for: indexPath) as! AlbumTableViewCell
        
        let album = _albums[indexPath.row]
        let viewModel = AlbumCellViewmodel(album: album)
        cell.configureView(viewModel: viewModel)
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }
    
    func album(at indexPath:IndexPath)->Album{
        return _albums[indexPath.row]
    }
}

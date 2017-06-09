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
    var tableView:UITableView?
    let pendingOperation = PendingOperation()
    override init(){
        super.init()
        
    }
    
    
    
    convenience init(albums:[Album],tableView:UITableView ){
          self.init()
        _albums = albums
        self.tableView = tableView
      
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
        if album.artWorkState == .placeholder{
            downloadArtwork(album: album, indexPath: indexPath)
        }
        return cell
        
    }
    
    func album(at indexPath:IndexPath)->Album{
        return _albums[indexPath.row]
    }
    
    
    
    func downloadArtwork(album: Album, indexPath: IndexPath){
        
        //# untuk cek jika punya
        if let _ = pendingOperation.downloadInProgess[indexPath]{
            return
        }
        let downloader = ArtworkDownloader(album: album)
        downloader.completionBlock = {
            if(downloader.isCancelled){
                return
            }
            
            self.pendingOperation.downloadInProgess.removeValue(forKey: indexPath)
            DispatchQueue.main.async {
                self.tableView!.reloadRows(at: [indexPath], with: .automatic)
                
            }
        }
        pendingOperation.downloadInProgess[indexPath] = downloader
        pendingOperation.downloadQue.addOperation(downloader)
    }
    
    
    
    func update(albums: [Album]){
        self._albums = albums
    }
}

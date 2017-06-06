//
//  AlbumTableViewController.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController {

    var _artist: Artist!
    private struct Constants{
        static let AlbumCellHeight: CGFloat = 80
        
        
    }
    lazy var _dataSource: AlbumListDataSource = {
        return AlbumListDataSource(albums: self._artist._album)
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = _artist._name
        tableView.dataSource = _dataSource
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum"{
            if let indexPath = super.tableView.indexPathForSelectedRow{
               let selectedAlbum = _dataSource.album(at: indexPath)
               selectedAlbum.songs = Stub.songs
                
                let albumDetailController: AlbumDetailViewController = segue.destination as! AlbumDetailViewController
                albumDetailController._album = selectedAlbum
            }
            
        }
    }

}

//
//  AlbumDetailViewController.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UITableViewController {

    @IBOutlet weak var _labelDate: UILabel!
    @IBOutlet weak var _labelGenre: UILabel!
    @IBOutlet weak var _imageViewArtwork: UIImageView!
    @IBOutlet weak var _labelALbum: UILabel!
    
    
    var _album: Album? = nil
    
    lazy var _albumDetailDataSource: AlbumDetailDataSource = {
        return AlbumDetailDataSource(songs: self._album!.songs)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let album = _album{
            self.configureView(album: album)
        }
        
        super.tableView.dataSource = _albumDetailDataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureView(album:Album){
        
        
        
        let viewModel:AlbumDetailViewModel = AlbumDetailViewModel(album: album)
        _labelALbum.text = viewModel._title
        _labelGenre.text = viewModel._genre
        _labelDate.text = viewModel._releaseDate
    }


    //MARK: - delegate
    
    
    
}

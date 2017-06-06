//
//  AlbumTableViewCell.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    static let reuseIdentifier:String = "AlbumCell"
    @IBOutlet weak var _labelDate: UILabel!
    @IBOutlet weak var _labelGenre: UILabel!
    @IBOutlet weak var _labelAlbum: UILabel!
    @IBOutlet weak var _imageViewArtwork: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    func configureView(viewModel: AlbumCellViewmodel){
        _labelAlbum.text = viewModel._title
        _labelGenre.text = viewModel._genre
        
        _labelDate.text = viewModel._releaseDate
        
        
    }
}

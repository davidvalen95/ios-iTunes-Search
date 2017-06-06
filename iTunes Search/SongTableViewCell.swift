//
//  SongTableViewCell.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    static let ReuseIdentifier = "songCell"
    
    @IBOutlet weak var _labelDate: UILabel!
    @IBOutlet weak var _labelSongTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func configureView(songViewModel: SongViewModel){
        _labelSongTitle.text = songViewModel._title
        _labelDate.text = songViewModel._runTime
    }
}

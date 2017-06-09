//
//  AlbumDetailViewController.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UITableViewController {


    @IBOutlet weak var _imageViewArtwork: UIImageView!
    @IBOutlet weak var _labelAlbum: UILabel!

    @IBOutlet weak var _labelGenre: UILabel!
    
    @IBOutlet weak var _labelDate: UILabel!
    
    var _album: Album?{
        didSet{
            if let album = self._album{
//                configureView(album: album)
                _albumDetailDataSource.update(songs: album.songs)
                super.tableView?.reloadData()
            }
        }
    }
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
        
        
        
        if let viewModel:AlbumDetailViewModel = AlbumDetailViewModel(album: album){
            
            _labelGenre.text? = viewModel._genre
            _labelDate.text? = viewModel._releaseDate
            _labelAlbum.text? = viewModel._title
        }
    }


    //MARK: - delegate
    func coba  (data: Data?, response:URLResponse?, error:Error?){
        
    }

    func encodeParameters(parameters: [String:Any]) -> String{
        
        var components: [(String,String)] = []
        
        let sortedKeys = parameters.keys.sorted{$0<$1}
        
        
        
        for key in sortedKeys{
            let value:Any = parameters[key]
            let queryComponents = queryComponent(keyy: key, valuee: value)
            components.append(contentsOf: queryComponents)
            
        }
        let encodedComponents:[String] = components.map{key, value in
            return "\(key)=\(value)"
            
        }
        
        
        return encodedComponents.joined(separator: "$")
        
        
    }
    
    func queryComponent(keyy: String, valuee:Any) -> [(String,String)]{
       //rule 1
        var components =  [(String,String)]()
        if let dictionary = valuee as? [String: Any]{
            for (nestedKey, value) in dictionary{
                let nestedComponent = queryComponent(keyy: "\(keyy)[\(nestedKey)]", valuee: value)
                
                components.append(contentsOf: nestedComponent)
            }
        }else if let array = valuee as? [Any]{
            for value in array{
                let nestedComponent = queryComponent(keyy: "\(keyy)[]", valuee: value)
                 components.append(contentsOf: nestedComponent)
            }
        }else{
            let encodedKey = keyy.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            let encodedValue = "\(valuee)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            let component:(String,String) = (encodedKey,encodedValue)
            components.append(component)
        }
        
        
        return components
    }
 
}




































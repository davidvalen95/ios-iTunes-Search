//
//  ResultTableViewController.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/6/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit

class ResultTableViewController: UITableViewController {

    lazy var _controllerSearch: UISearchController = {
        
        var temp = UISearchController(searchResultsController: nil)
     temp.dimsBackgroundDuringPresentation = false
        temp.searchResultsUpdater = self
        return temp
        
    
    }()
    
    let _dataSource:ResultDataSource = ResultDataSource()
    
    let client = ItunesAPiClient()
    override func viewDidLoad() {
        super.viewDidLoad()
        let height = UIApplication.shared.statusBarFrame.height
        
//        super.tableView.contentInset = UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)

        let buttonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.dismissSearchResultController))
         self.navigationItem.rightBarButtonItem = buttonItem
        self.navigationController?.navigationBar.isHidden = false
        
        super.tableView.tableHeaderView = _controllerSearch.searchBar
        super.tableView.dataSource = _dataSource
        
        super.definesPresentationContext  = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func dismissSearchResultController(){
        self.dismiss(animated: true, completion: nil)
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:UITableViewCell? = tableView.cellForRow(at: indexPath)
        print(cell?.textLabel?.text ?? "no")
        
    }
 
    //MARK: - navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbums"{
            if let indexPath = super.tableView.indexPathForSelectedRow{
                let artist:Artist = _dataSource.getArtist(at: indexPath)
                let albumListController: AlbumTableViewController = segue.destination as! AlbumTableViewController
                albumListController._artist = artist
                
                
                client.lookUpArtist(id: artist._id){artist, error in
                    albumListController._artist = artist
//                    albumListController.tableView.reloadData()
                }
                
                
            }
        }
    }
    

}

extension ResultTableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        self.client.searchForArtist(term: searchController.searchBar.text!){[weak self] artists , error in
            self?._dataSource.updateArtist(artists: artists)
            self?.tableView.reloadData()
            
        }
        super.tableView.reloadData()
    }
}

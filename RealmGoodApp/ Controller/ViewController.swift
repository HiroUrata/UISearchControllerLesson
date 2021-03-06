//
//  ViewController.swift
//  RealmGoodApp
//
//  Created by UrataHiroki on 2021/08/03.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController()
    
    let cellContentsArray = ["UITableView","UISearchController","UIView","UIColor","UICollectionView","UISwich","UIKit","UITextField","UIViewController","UILabel"]
    
    var searchResultArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        title = "cellContentsArray"
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchBar.delegate = self
        searchController.searchBar.scopeButtonTitles = ["Vで検索","Fで検索","Cで検索"]
        searchController.searchBar.showsBookmarkButton = true
        
    }
    
   
}

extension ViewController:UISearchBarDelegate{
    
//    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
//        //ブックマークが押された時の処理
//
//
//    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        switch selectedScope {
        
        case 0:
            searchResultArray = []
            cellContentsArray.forEach { cellContent in
                
                if cellContent.contains(searchBar.scopeButtonTitles![selectedScope].prefix(1)){
                    
                    searchResultArray.append(cellContent)
                    title = "”\(searchBar.scopeButtonTitles![selectedScope].prefix(1))”で検索中"
                    tableView.reloadData()
                }
            }
                
        case 1:
            searchResultArray = []
            cellContentsArray.forEach { cellContent in
                
                if cellContent.contains(searchBar.scopeButtonTitles![selectedScope].prefix(1)){
                    
                    searchResultArray.append(cellContent)
                    title = "”\(searchBar.scopeButtonTitles![selectedScope].prefix(1))”で検索中"
                    tableView.reloadData()
                }
            }
            
        case 2:
            searchResultArray = []
            cellContentsArray.forEach { cellContent in
                
                if cellContent.contains(searchBar.scopeButtonTitles![selectedScope].prefix(1)){
                    
                    searchResultArray.append(cellContent)
                    title = "”\(searchBar.scopeButtonTitles![selectedScope].prefix(1))”で検索中"
                    tableView.reloadData()
                }
            }
            
        default:
            searchResultArray = []
            title = "cellContentsArray"
            tableView.reloadData()
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchResultArray = []
        cellContentsArray.forEach { cellContent in
            
            if cellContent.contains(searchText) == true {
                
                searchResultArray.append(cellContent)
                title = "”\(searchText)”で検索中"
                tableView.reloadData()
                
            }else if searchText == ""{
                
                tableView.reloadData()
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
     
        searchResultArray = []
        title = "cellContentsArray"
        tableView.reloadData()
    }
    
}


extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.size.height / 7
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return {() -> Int in
            
            switch searchResultArray.count > 0{
            
            case true: return searchResultArray.count
                
            case false: return cellContentsArray.count
                
            }
        }()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = {() -> String in
           
            switch searchResultArray.count > 0{
            
            case true: return searchResultArray[indexPath.row]
                
            case false: return cellContentsArray[indexPath.row]
            }
        }()
        
        return cell
    }
    
}

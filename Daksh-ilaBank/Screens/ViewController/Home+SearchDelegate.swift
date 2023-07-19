//
//  Home+SearchDelegate.swift
//  Daksh-ilaBank
//
//  Created by Neosoft on 04/07/23.
//

import Foundation
import UIKit

//MARK: Searchbar delegate handler

extension HomeViewController : UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        homeViewModel.isSearchActive = true
        searchBar.showsCancelButton = true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        homeViewModel.searchSports(txt: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        homeViewModel.isSearchActive = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar){
        //hide cancel button when editing ended
        searchBar.text = ""
        if !homeViewModel.isSearchActive {
            searchBar.showsCancelButton = false
        }
    }
}

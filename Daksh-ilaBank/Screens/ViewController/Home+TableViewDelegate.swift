//
//  Home+TableViewExtension.swift
//  Daksh-ilaBank
//
//  Created by Neosoft on 04/07/23.
//

import UIKit

//MARK: TableView delegate handler

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return homeViewModel.numberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return homeViewModel.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        return homeViewModel.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return homeViewModel.tableView(tableView, heightForRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if section == 1 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "tableHeaderCell") as! TableHeaderCell
            header.searchBar.delegate = self
            header.searchHint = homeViewModel.getSearchHintText()
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        if section == 1 {
            return 60
        }
        return 0
    }
}

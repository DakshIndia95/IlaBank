//
//  TableHeaderCell.swift
//  Daksh-ilaBank
//
//  Created by Neosoft on 04/07/23.
//

import UIKit

class TableHeaderCell: UITableViewHeaderFooterView{
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchHint = ""{
        didSet{
            searchBar.searchTextField.placeholder = "Search " + searchHint
        }
    }
    override class func awakeFromNib(){
        super.awakeFromNib()
    }
}

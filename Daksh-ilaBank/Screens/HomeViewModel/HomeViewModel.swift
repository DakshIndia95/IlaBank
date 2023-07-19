//
//  HomeViewModel.swift
//  Daksh-ilaBank
//
//  Created by Neosoft on 04/07/23.
//

import Foundation
import UIKit

protocol SportsServices: AnyObject{
    func reloadData() // Data Binding - PROTOCOL (View and ViewModel Communication)
}

class HomeViewModel{
    private var categoryList : [HomeSportsData] = []{
        didSet {
            self.sportsDelegate?.reloadData()
        }
    }
    var isSearchActive = false{
        didSet {
            sportsDelegate?.reloadData()
            if !isSearchActive{
                searchList = categoryList
            }
        }
    }
    private var searchList : [HomeSportsData] = []
    private var pageNumber = 0
    let databaseHelper = JSONHelper()
    weak var sportsDelegate: SportsServices?

    func getSportsList(){
        if let data = databaseHelper.loadJsonDataFromFile(){
            let sportsData = data.data ?? []
            categoryList = sportsData
            searchList = sportsData
        }
    }
    
    func searchSports(txt:String){
        print("Text: \(txt)")
        if let teams = categoryList[pageNumber].teams,teams.count > 0{
            let filterList = teams.filter({$0.name.localizedCaseInsensitiveContains(txt)})
            searchList[pageNumber].teams = filterList
            print("SearchList: \(filterList)")
            isSearchActive = true
        }
    }
    
    //MARK: Update carousel
    func setPageIndex(_ index: Int){
        isSearchActive = false
        pageNumber = index
        sportsDelegate?.reloadData()
    }
    
    func getSearchHintText() -> String{
        if categoryList.count > pageNumber{
            return categoryList[pageNumber].sportsName ?? ""
        }
        return ""
    }
}

extension HomeViewModel{
    func numberOfSections(in tableView: UITableView) -> Int{
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0{
            return 1
        }else{
            if isSearchActive{
                return searchList[pageNumber].teams?.count ?? 0
            }else{
                return categoryList[pageNumber].teams?.count ?? 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let section = indexPath.section
        
        if section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath) as! HomeTableViewCell

            if isSearchActive{
                guard searchList[pageNumber].teams?.count ?? 0 > indexPath.row else{
                    return UITableViewCell()
                }
                if let teamList = searchList[pageNumber].teams?[indexPath.row]{
                    cell.lblName.text = teamList.name
                    cell.imgLogo.image = UIImage(named: teamList.logo ?? "")
                }
            }else{
                guard categoryList[pageNumber].teams?.count ?? 0 > indexPath.row else{
                    return UITableViewCell()
                }
                if let teamList = categoryList[pageNumber].teams?[indexPath.row]{
                    cell.lblName.text = teamList.name
                    cell.imgLogo.image = UIImage(named: teamList.logo ?? "")
                }
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCarouselCell", for: indexPath) as! ImageCarouselCell
            guard categoryList.count > indexPath.row else{
                return UITableViewCell()
            }
            cell.sportsList = categoryList
            cell.registerCollectionViewCell()
            cell.selectedCategoryIndex = { [weak self] index in
                self?.setPageIndex(index)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if isSearchActive && indexPath.section == 0{
            return 0
        }else{
            return UITableView.automaticDimension
        }
    }
}

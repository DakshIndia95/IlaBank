//
//  HomeViewController.swift
//  Daksh-ilaBank
//
//  Created by Neosoft on 04/07/23.
//

import UIKit

class HomeViewController : UIViewController{
    //MARK: Home Screen Outlets
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    lazy var homeViewModel = HomeViewModel()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        getSportsData()
        registerTableView()
    }
    
    func registerTableView(){
        let mainNib = UINib(nibName: "HomeTableViewCell",bundle: nil)
        let headerNib = UINib(nibName: "TableHeaderCell", bundle: nil)
        let carouselNib = UINib(nibName: "ImageCarouselCell", bundle: nil)
        
        homeTableView.register(mainNib, forCellReuseIdentifier: "homeTableViewCell")
        homeTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "tableHeaderCell")
        homeTableView.register(carouselNib, forCellReuseIdentifier: "imageCarouselCell")
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        //Remove section header blank space
        homeTableView.sectionHeaderTopPadding = 0
    }
    
    //MARK: Get data from json
    func getSportsData(){
        homeViewModel.sportsDelegate = self
        homeViewModel.getSportsList()
    }
    
    func reloadTableView(){
        DispatchQueue.main.async{
            self.homeTableView.reloadData()
        }
    }
}

extension HomeViewController : SportsServices{
    func reloadData(){
        self.reloadTableView()
    }
}

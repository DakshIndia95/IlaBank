//
//  ImageCarouselCell.swift
//  Daksh-ilaBank
//
//  Created by Neosoft on 04/07/23.
//

import UIKit

class ImageCarouselCell: UITableViewCell{

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var currentPageController: UIPageControl!
    
    var currentPageIndex = 0
    var sportsList : [HomeSportsData] = []{
        didSet {
            reloadCollectionViewCell()
        }
    }
    
    var selectedCategoryIndex: ((Int) -> Void)?
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    func registerCollectionViewCell(){
        let catNib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        categoryCollectionView.register(catNib, forCellWithReuseIdentifier: "categoryCollectionViewCell")
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        reloadCollectionViewCell()
    }
    
    func reloadCollectionViewCell(){
        currentPageController.numberOfPages = sportsList.count
        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
        }
    }
}


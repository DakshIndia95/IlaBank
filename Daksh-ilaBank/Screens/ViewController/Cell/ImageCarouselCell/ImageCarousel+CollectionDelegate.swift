//
//  ImageCarousel+CollectionDelegate.swift
//  Daksh-ilaBank
//
//  Created by Neosoft on 04/07/23.
//

import Foundation
import UIKit

//MARK: Carousel CollectionView delegate handler

extension ImageCarouselCell : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        guard sportsList.count > indexPath.row else{
            return UICollectionViewCell()
        }
        cell.imgBanner.image = UIImage(named: sportsList[indexPath.row].logo ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: collectionView.frame.width*0.9, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        let currentIndex = Int(offSet + horizontalCenter) / Int(width)
        selectedCategoryIndex?(currentIndex)
        currentPageController.currentPage = currentIndex
    }
}

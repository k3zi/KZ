//
//  CollectionViewController.swift
//  
//
//  Created by Kesi Maduka on 8/6/15.
//
//

import UIKit

class KZCollectionViewController: KZViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView? = nil
    var items = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = RGB(255)
        //collectionView!.registerClass(PictureCollectionViewCell.self, forCellWithReuseIdentifier: "PictureCollectionViewCell")
        
        let photoBT = UIButton()
        photoBT.setImage(UIImage(named: "roundCameraIcon"), forState: .Normal)
        view.addSubview(photoBT)
        photoBT.autoPinEdgeToSuperviewEdge(.Right, withInset: 20.0)
        photoBT.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 20.0)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PictureCollectionViewCell", forIndexPath: indexPath)
        return cell
    }

}
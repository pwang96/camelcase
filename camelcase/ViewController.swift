//
//  ViewController.swift
//  camelcase
//
//  Created by Peter Wang on 7/25/17.
//  Copyright © 2017 Peter Wang. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var colorArray = [UIColor]()
    var imageArray = [UIImage]()
    var titleArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorArray += [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]
        
        imageArray += [UIImage(named: "budget")!, UIImage(named: "journey")!,
                         UIImage(named: "learn")!, UIImage(named: "settings")!]
        
        titleArray += ["Budget", "Journey", "Learn", "Settings"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NavigationCollectionViewCell
        
        
        // Set cell properties
        cell.backgroundColor = colorArray[indexPath.row]
        
        cell.navImage.image = imageArray[indexPath.row]
        
        cell.navLabel.text = titleArray[indexPath.row]
        
        return cell
    }


}


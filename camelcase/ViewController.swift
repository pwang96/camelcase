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
    var segueArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorArray += [hexStringToUIColor(hex: "75CA95"), hexStringToUIColor(hex: "D8C8AC"),
                       hexStringToUIColor(hex: "BE9769"), hexStringToUIColor(hex: "99DEF2")]
        
        imageArray += [UIImage(named: "budget")!, UIImage(named: "journey")!,
                         UIImage(named: "learn")!, UIImage(named: "settings")!]
        
        titleArray += ["Budget", "Journey", "Learn", "Settings"]
        
        segueArray += ["SegueBudget", "SegueJourney", "SegueLearn", "SegueSettings"]
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
        cell.navLabel.textColor = UIColor.white
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: segueArray[indexPath.row], sender: self)
    }
    
    // MARK: Private Functions
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }


}


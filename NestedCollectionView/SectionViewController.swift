//
//  SectionViewController.swift
//  NestedCollectionView
//
//  Created by Mahmoud Waked on 1/23/21.
//

import UIKit

class SectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var listOfImages: UICollectionView!
    
    var listOfItems: Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad, SectionViewController")
    }
    
    func display(contentController content: UIViewController, on view: UIView) {
        self.addChild(content)
        content.view.frame = view.bounds
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemSectionCell", for: indexPath as IndexPath) as! ItemSectionCell
        
        print("image, \(listOfItems[indexPath.row])")
        
        cell.image.loadImage(url: listOfItems[indexPath.row])
 
        return cell
    }
    
}

extension UIImageView{
    // Load image from url
    func loadImage(url: String){
        do {
            let url = URL(string: url)
            let data = try Data(contentsOf: url!)
            self.image = UIImage(data: data)
        }
        catch{
            print(error)
        }
    }
}



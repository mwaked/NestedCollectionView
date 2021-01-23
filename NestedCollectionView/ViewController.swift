//
//  ViewController.swift
//  NestedCollectionView
//
//  Created by Mahmoud Waked on 1/22/21.
//

import UIKit
import ImageSlideshow

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    private var homeData: HomeData? = nil
    
    private var listOgSliderImages: Array<AlamofireSource> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        getData()

    }
    
    private func getData(){
        
        // Dummy data for testing
        let sliders: Array<String> = ["https://images.pexels.com/photos/257360/pexels-photo-257360.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", "https://images.pexels.com/photos/38537/woodland-road-falling-leaf-natural-38537.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", "https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "https://images.pexels.com/photos/1766838/pexels-photo-1766838.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "https://images.pexels.com/photos/259915/pexels-photo-259915.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"]
        let sections = [sliders, sliders, sliders,sliders]
        homeData = HomeData(sliders: sliders, sections: sections)
        
        for item in homeData?.sliders ?? []{
            listOgSliderImages.append(AlamofireSource(urlString: item)!)
        }
        
        homeCollectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeData?.sections.count ?? 0 + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == 0){
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath as IndexPath) as! SliderCell
               
               cell.imagesSlider.setImageInputs(listOgSliderImages)
        
               return cell
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath as IndexPath) as! SectionCell
            
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "SectionViewController"))! as! SectionViewController
            vc.view.frame = cell.bounds
            vc.listOfItems = homeData?.sections[indexPath.row - 1] ?? []
            self.addChild(vc)
            cell.addSubview(vc.view)
            
            return cell
            
        }
        
    }
    
}


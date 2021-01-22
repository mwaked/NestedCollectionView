//
//  HomeData.swift
//  NestedCollectionView
//
//  Created by Mahmoud Waked on 1/22/21.
//

import Foundation

struct HomeData {
    
    var sliders: Array<String>
    var sections: Array<Array<String>>
    
    init(sliders: Array<String>, sections: Array<Array<String>>) {
        self.sliders = sliders
        self.sections = sections
    }
    
}

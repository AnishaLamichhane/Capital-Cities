//
//  Capital.swift
//  project16
//
//  Created by Anisha Lamichhane on 8/8/20.
//  Copyright © 2020 Anisha Lamichhane. All rights reserved.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
    
    
}

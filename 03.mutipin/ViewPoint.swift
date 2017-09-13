//
//  ViewPoint.swift
//  03.mutipin
//
//  Created by D7703_23 on 2017. 9. 13..
//  Copyright © 2017년 D7703_23. All rights reserved.
//

import UIKit
import MapKit

class ViewPoint: NSObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?

    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

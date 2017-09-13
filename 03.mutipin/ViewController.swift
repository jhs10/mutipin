//
//  ViewController.swift
//  03.mutipin
//
//  Created by D7703_23 on 2017. 9. 12..
//  Copyright © 2017년 D7703_23. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        zoomToRegion()
        
        let a = ViewPoint(coordinate: CLLocationCoordinate2D(latitude: 35.166197, longitude: 129.072594), title: "dong", subtitle: "dream")
        let b = ViewPoint(coordinate: CLLocationCoordinate2D(latitude: 35.168444, longitude: 129.057832), title: "park", subtitle: "rest")
        
        myMapView.addAnnotations([a, b])
        
        myMapView.delegate = self
        
    }
    
    func zoomToRegion() {
        
        let location = CLLocationCoordinate2D(latitude: 35.166197, longitude: 129.072594)
        let region = MKCoordinateRegionMakeWithDistance(location, 2000.0, 4000.3)
        myMapView.setRegion(region, animated: true)
    }
    
    // MKMapViewDelegate method
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "myPin"
        
        // an already allocated annotation view
        var annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            //annotationView?.pinTintColor = UIColor.green
            annotationView?.animatesDrop = true
        } else {
            annotationView?.annotation = annotation
        }
        
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named:"logo.png" )
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        let btn = UIButton(type: .detailDisclosure)
        annotationView?.rightCalloutAccessoryView = btn

        
        return annotationView
        
    }
    
    // callout accessary를 눌렀을때 alert View 보여줌
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if control == view.rightCalloutAccessoryView{
            
            self.performSegue(withIdentifier: "goDetail", sender: self)
            
        }
        
//        let viewAnno = view.annotation //as! ViewPoint
//        let placeName = viewAnno?.title
//        let placeInfo = viewAnno?.subtitle
//        
//        let ac = UIAlertController(title: placeName!, message: placeInfo!, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(ac, animated: true, completion: nil)
    }

}

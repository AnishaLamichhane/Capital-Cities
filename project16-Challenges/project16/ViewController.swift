//
//  ViewController.swift
//  project16
//
//  Created by Anisha Lamichhane on 8/8/20.
//  Copyright © 2020 Anisha Lamichhane. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "MapType", style: .done, target: self, action: #selector(changeMapType))
         
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.50722, longitude: -0.1275), info: "Home to the 2012 home olympics")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "It was founded over a years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the city of light")
        let kathmandu = Capital(title: "Kathmandu", coordinate: CLLocationCoordinate2D(latitude:27.7172, longitude:85.3240), info: "The capital of Nepal")
        let washington = Capital(title: "Washington", coordinate: CLLocationCoordinate2D(latitude: 38.519555, longitude: -77.3666), info: "The America is here folks.")
        
        mapView.addAnnotations([london, oslo, paris, kathmandu, washington])
    }
    @objc func changeMapType() {
        let ac = UIAlertController(title: "Pick the mapType", message: nil, preferredStyle: .actionSheet)
        let satellite = UIAlertAction(title: "Satellite", style: .default){ _ in
            self.mapView.mapType = .satellite
        }
        let standard = UIAlertAction(title: "Standard", style: .default){ _ in
            self.mapView.mapType = .standard
        }
        let hybrid = UIAlertAction(title: "Hybrid", style: .default){ _ in
            self.mapView.mapType = .hybrid
        }
        let mutatedStandard = UIAlertAction(title: "Mutated Standard", style: .default){ _ in
            self.mapView.mapType = .mutedStandard
        }
        let Cancel = UIAlertAction(title: "Mutated Standard", style: .cancel)
        
        ac.addAction(satellite)
        ac.addAction(standard)
        ac.addAction(hybrid)
        ac.addAction(mutatedStandard)
        ac.addAction(Cancel)
        present(ac, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        let identifier = "Capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView ?? nil
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.pinTintColor = .purple
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let placeName = capital.title
        let placeInfo = capital.info
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        let webBtn = UIAlertAction(title: "Wikipedia", style: .default){ _ in
            self.showWebView(title: placeName!)
        }
        ac.addAction(webBtn)
        present(ac, animated: true)
    }
    
    func showWebView(title: String) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailWebView else { return }
        vc.url = title
        navigationController?.pushViewController(vc, animated: true)
       
       }
}


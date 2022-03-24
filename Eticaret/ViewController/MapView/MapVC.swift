//
//  MapVC.swift
//  Eticaret
//
//  Created by yunus oktay on 24.03.2022.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: BaseViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    let coordiantes = [
        CLLocationCoordinate2D(latitude: 41.047423, longitude: 28.987648),
        CLLocationCoordinate2D(latitude: 41.091425, longitude: 29.116824),
        CLLocationCoordinate2D(latitude: 40.993374, longitude: 29.055560),
        CLLocationCoordinate2D(latitude: 41.097464, longitude: 29.159313)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coordiantes.forEach{ coordinate in
            let annot = MKPointAnnotation()
            annot.coordinate = coordinate
            mapView.addAnnotation(annot)
        }
        
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
    }
}

extension MapVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationValue = manager.location?.coordinate else {return}
        let region = MKCoordinateRegion(center: locationValue, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        mapView.setRegion(region, animated: true)
        
        let annotion = MKPointAnnotation()
        annotion.coordinate = locationValue
        mapView.addAnnotation(annotion)
    }
}

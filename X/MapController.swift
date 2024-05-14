//
//  MapController.swift
//  X
//
//  Created by Kevin Hsiao on 2024/5/13.
//  Copyright © 2024 Thino Inc. All rights reserved.
//

import UIKit
import CoreLocation

let kAmapApiKey = "bb225f8513d8d042c556f1413ec49e3e"

class MapController: BaseViewController {

    var zoomLevel: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLocation()
        self.setupMap()
        self.setupViews()
    }

    func setupLocation() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
        } else {
            let title = "允许定位"
            let message = "在设置中打开定位"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "打开定位", style: .destructive) { action in
                guard let url = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                UIApplication.shared.open(url)
            }

            let cancelAction = UIAlertAction(title: "取消", style: .cancel)
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true)
        }
    }

    func updateZoomLevel() {
        guard var zoomLevel = self.zoomLevel else { return }
        if zoomLevel < self.mapView.minZoomLevel {
            zoomLevel = self.mapView.minZoomLevel
        } else if zoomLevel > self.mapView.maxZoomLevel {
            zoomLevel = self.mapView.maxZoomLevel
        }
        self.mapView.setZoomLevel(zoomLevel, animated: true)
    }

    func setupMap() {
        AMapServices.shared().apiKey = kAmapApiKey
    }

    func setupViews() {
        self.view.backgroundColor = .yellow
        self.view.addSubview(self.mapView)
    }

    private lazy var mapView: MAMapView = {
        let map = MAMapView()
        map.frame = self.view.bounds
        map.backgroundColor = .blue
        map.delegate = self
        map.isShowsUserLocation = true
        map.userTrackingMode = .followWithHeading
        map.zoomLevel = 20
        return map
    }()

    private lazy var minBtn: BaseButton = {
        let btn = BaseButton()
        btn.touchUpInsideCallback = { [weak self] in
            guard let `self` = self else { return }
            self.zoomLevel -= 1
            self.updateZoomLevel()
        }
        return btn
    }()

    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10.0
        return locationManager
    }()

    private lazy var userLocationView: MAUserLocationRepresentation = {
        let r = MAUserLocationRepresentation()
        r.fillColor = UIColor.orange
        r.strokeColor = UIColor.green
        return r
    }()

}

extension MapController: MAMapViewDelegate {

    func mapView(_ mapView: MAMapView!, mapDidZoomByUser wasUserAction: Bool) {
        self.zoomLevel = self.mapView.zoomLevel
    }

    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {

    }

}

extension MapController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("locationManager: -didUpdateLocations=\(location)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("locationManager: -didFailWithError=\(error)")
    }

}

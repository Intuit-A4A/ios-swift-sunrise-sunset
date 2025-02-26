//
//  MapViewController.swift
//  SunriseSunset
//

import UIKit
import SwiftUI
import Combine
import MapKit

public class MapViewController: UIViewController {
    var cancelleble = Set<AnyCancellable>()
    var mapViewModel = MapViewModel()
    public var regionCallback: ((_ lat: Double, _ lng: Double) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        mapViewModel.$region.sink { region in
            self.regionCallback?(region.center.latitude, region.center.longitude)
        }.store(in: &cancelleble)
        
        let mapDetailView = MapView(model: mapViewModel)
        
        let hostingVC = UIHostingController(rootView: mapDetailView)

        self.view.addSubview(hostingVC.view)
        
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingVC.view.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            hostingVC.view.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            hostingVC.view.widthAnchor.constraint(equalToConstant: self.view.bounds.size.width)
        ])
    }
}

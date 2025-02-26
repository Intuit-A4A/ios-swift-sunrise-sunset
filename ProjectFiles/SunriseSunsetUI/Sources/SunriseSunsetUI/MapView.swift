//
//  SwiftUIView.swift
//

import SwiftUI
import MapKit

public class MapViewModel: ObservableObject {
    @Published public var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 32.957722, longitude: -117.158081), span: MKCoordinateSpan(latitudeDelta: 20.0, longitudeDelta: 20.0))
    
    public init() { }
}

/// Presents a Maps view with input of a MapViewModel,
///
/// - Parameters:
///   - model:An observed object of MapViewModel
///
public struct MapView: View {
    let height = 360.0
    
    @ObservedObject var model: MapViewModel
    
    public init(model: MapViewModel) {
        self.model = model
    }
    
    public var body: some View {
        ZStack {
            Map(coordinateRegion: $model.region, interactionModes: [.zoom, .pan])
                .frame(maxWidth: .infinity, maxHeight: height)
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 2)
                .foregroundColor(Color.black.opacity(0.5))
            Rectangle()
                .frame(maxWidth: 2, maxHeight: height)
                .foregroundColor(Color.black.opacity(0.5))
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: height)
                    .foregroundColor(Color.black.opacity(0.75))
                Circle()
                    .blur(radius: 40)
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
            .ignoresSafeArea()
            .allowsHitTesting(false)
        }
    }
}

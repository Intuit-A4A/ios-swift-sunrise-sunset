//
//  ContentView.swift
//

import SwiftUI
import SunriseSunsetUI

struct ContentView: View {
    var body: some View {
        MapView(model: MapViewModel())
    }
}

// Uncomment to get live canvas
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

// Example implementation of a UIViewControllerRepresentable if you are wanting to implement in UIKIt
//
//struct ExampleView: UIViewControllerRepresentable {
//    typealias UIViewControllerType = ExampleViewController
//
//    func makeUIViewController(context: Context) -> ExampleViewController {
//        ExampleViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: ExampleViewController, context: Context) {
//        // Update UIView
//    }
//}

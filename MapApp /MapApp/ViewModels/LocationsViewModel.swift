import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current position on map
    @Published var mapRegion: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion())
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    // Show location details via sheet
    @Published var sheetLocation: Location? = nil

    // Change animation deriction for locationsPreviewStack ( true: <- View  false: View ->)
    @Published var leftAnimationDirection: Bool = true
    
    // Show location description
    @Published var  sheetLocationDescription: Location? = nil
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
        
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MapCameraPosition.region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        // Change animation direction ( View -> )
        leftAnimationDirection = true
        
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in locations array! Should never happen")
            return
        }
        
        // Check if the current index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // Next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    func PreviousButtonPressed() {
        // Change animation direction ( <- View )
        leftAnimationDirection = false
        
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in locations array! Should never happen")
            return
        }
        
        // Check if the current index is valid
        let previousIndex = currentIndex - 1
        guard locations.indices.contains(previousIndex) else {
            // Previous index is NOT valid
            // Restart from LAST index
            guard let lastLocation = locations.last else { return }
            showNextLocation(location: lastLocation)
            return
        }
        
        // Next index is valid
        let previousLocation = locations[previousIndex]
        showNextLocation(location: previousLocation)
    }
}


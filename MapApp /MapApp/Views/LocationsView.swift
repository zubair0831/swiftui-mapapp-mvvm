//
//  LocationsView.swift
//  MapApp
//
//  Created by zubair ahmed on 27/05/25.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapRegion) {
                ForEach(vm.locations) { location in
                    Annotation(location.name, coordinate: location.coordinates) {
                        LocationMapAnnotationView()
                            .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                            .shadow(radius: 10)
                            .onTapGesture {
                                vm.showNextLocation(location: location)
                            }
                    }
                }
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
            }
            .ignoresSafeArea()
            
            CityName
        }
        .sheet(item: $vm.sheetLocation , onDismiss: nil){
            location in
            LocationsDetailView(location: location)
        }
    }
}

// MARK: - City Name and Preview
extension LocationsView {
    
    private var CityName: some View {
        VStack(spacing: 0) {
            VStack {
                Button(action: {
                    vm.showLocationsList.toggle()
                }) {
                    Text("\(vm.mapLocation.name), \(vm.mapLocation.cityName)")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundStyle(Color.primary)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .overlay(alignment: .leading) {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .foregroundStyle(Color.primary)
                                .padding()
                                .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                        }
                }
                
                if vm.showLocationsList {
                    LocationsList()
                }
            }
            .background(.thickMaterial)
            .padding()
            .shadow(color: .black.opacity(0.3), radius: 20)
            
            Spacer()
            
            ZStack {
                ForEach(vm.locations) { location in
                    if vm.mapLocation == location {
                        LocationPreview(location: location)
                            .padding()
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)))
                    }
                }
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

//
//  LocationsDetailView.swift
//  MapApp
//
//  Created by zubair ahmed on 31/05/25.
//

import SwiftUI
import _MapKit_SwiftUI

struct LocationsDetailView: View {
    @EnvironmentObject var vm:LocationsViewModel
    let location:Location
    var body: some View {
        ScrollView{
            VStack{
                TabView {
                    ForEach(location.imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                            .clipped()
                    }
                }
                .frame(height: 500)
                .tabViewStyle(PageTabViewStyle())
            }
            VStack(alignment: .leading, spacing: 16){
                VStack(alignment: .leading, spacing: 8){
                    Text(location.name)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text(location.cityName)
                        .font(.title3)
                        .foregroundStyle(Color.secondary)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                Divider()
                VStack(alignment: .leading, spacing: 16){
                    Text(location.description)
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                    if let url = URL(string: location.link){
                        Link("ReadMore", destination: url)
                            .font(.headline)
                            .foregroundStyle(Color.blue.opacity(0.9))
                    }
                    
                }
                .padding()
                Divider()
                mapLayer
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton,alignment: .topLeading)
    }
}
extension LocationsDetailView {
    private var backButton: some View {
        Button {
            vm.sheetLocation=nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .background(.thickMaterial)
                .clipShape(Circle())
                .shadow(radius: 4)
                .foregroundColor(.primary)
                .padding()
        }
    }
    
    private var mapLayer: some View {
        Map(position: .constant(.region(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )))) {
            Annotation(location.name, coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }
}
#Preview {
    LocationsDetailView(location:LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
        
}

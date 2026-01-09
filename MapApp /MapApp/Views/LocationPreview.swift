//
//  LocationPreview.swift
//  MapApp
//
//  Created by zubair ahmed on 28/05/25.
//

import SwiftUI

struct LocationPreview: View {
    let location:Location
    @EnvironmentObject var vm:LocationsViewModel
    var body: some View {
        HStack(spacing: 45) {
            VStack(spacing: 16){
                ZStack{
                    if let imageNames = location.imageNames.first{
                        Image(imageNames)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                          
                    }
                        
                }
                .padding(6)
                .background(Color.white)
                VStack(alignment: .leading,spacing: 4) {
                    Text(location.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(location.cityName)
                }
                .frame(maxWidth: .infinity)
            }
            
            VStack(spacing: 8){
                
                Button {
                    vm.sheetLocation = location
                } label: {
                    
                    Text("Learn More")
                        .font(.headline)
                        .frame(width: 125,height: 35)
                }
                .buttonStyle(.borderedProminent)
                Button {
                    vm.nextButtonPressed()
                } label: {
                    
                    Text("Next")
                        .font(.headline)
                        .frame(width: 125,height: 35)
                }
                .buttonStyle(.bordered)
            
            
            }
            
        }
        
        .background(
            RoundedRectangle(cornerSize: .zero)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .clipped()
        
    }
}

#Preview {
    LocationPreview(location: LocationsDataService.locations.first!)
        .padding()
        .environmentObject(LocationsViewModel())
}

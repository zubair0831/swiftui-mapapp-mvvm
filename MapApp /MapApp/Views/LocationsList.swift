//
//  LocationsList.swift
//  MapApp
//
//  Created by zubair ahmed on 28/05/25.
//

import SwiftUI

struct LocationsList: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        List{
            ForEach(vm.locations) { Location in
                Button {
                    vm.showNextLocation(location: Location)
                } label: {
                    listRowView(location: Location)
                        .padding(.vertical,4)
                        .listRowBackground(Color.clear)
                }

            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationsList()
        .environmentObject(LocationsViewModel())
}

extension LocationsList{
    private func listRowView(location: Location) -> some View {
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
        }
        
    }
}

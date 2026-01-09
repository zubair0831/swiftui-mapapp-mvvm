//
//  LocationMapAnnotationView.swift
//  MapApp
//
//  Created by zubair ahmed on 31/05/25.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0 ){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .font(.headline)
                .foregroundStyle(Color.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.accentColor)
                .frame(width : 10,height:10 )
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-3)
                .padding(.bottom,40)
            
            
            
        }
    }
}

#Preview {
    LocationMapAnnotationView()
}

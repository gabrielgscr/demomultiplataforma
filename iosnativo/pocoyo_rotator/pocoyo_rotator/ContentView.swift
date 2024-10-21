//
//  ContentView.swift
//  pocoyo_rotator
//
//  Created by Gabriel Gonzalez on 20/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotationAngle: Double = 0
    
    var body: some View {
           VStack {
               Image("pocoyo") // Reemplaza "tu_imagen" con el nombre de tu imagen en Assets.xcassets
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 300, height: 300)
                   .rotationEffect(.degrees(rotationAngle))  // Aplica la rotación a la imagen
                   .onAppear {
                       // Iniciar la animación cuando la vista aparece
                       withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
                           rotationAngle = 360  // Rotar 360 grados de manera indefinida
                       }
                   }
               Text("Rotación infinita")
                   .padding(.top, 20)
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color.white)
       }
}

#Preview {
    ContentView()
}

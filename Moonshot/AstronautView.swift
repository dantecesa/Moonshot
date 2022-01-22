//
//  AstronautView.swift
//  Moonshot
//
//  Created by Dante Cesa on 1/21/22.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .navigationTitle(astronaut.name)
        .background(.darkBackground)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
            .preferredColorScheme(.dark)
    }
}

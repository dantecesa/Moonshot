//
//  AstronautButton.swift
//  Moonshot
//
//  Created by Dante Cesa on 1/21/22.
//

import SwiftUI

struct AstronautButton: View {
    let crewMember: CrewMember
    
    var body: some View {
        NavigationLink (destination: {
            AstronautDetailView(astronaut: crewMember.astronaut)
        }, label: {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
            
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .font(.headline.bold())
                    .foregroundColor(.white)
                
                Text(crewMember.role)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        })
    }
}

struct AstronautButton_Previews: PreviewProvider {
    static var previews: some View {
        AstronautButton(crewMember: CrewMember.init(role: "Test Role", astronaut: Astronaut.init(id: "armstrong", name: "Neil Armstrong", description: "Sample descirption")))
            .preferredColorScheme(.dark)
    }
}

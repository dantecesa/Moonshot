//
//  ListLayout.swift
//  Moonshot
//
//  Created by Dante Cesa on 1/21/22.
//

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List() {
            ForEach(missions) { mission in
                NavigationLink(
                    destination: {
                        MissionDetailView(mission: mission, astronauts: astronauts)
                    }, label: {
                        HStack(spacing: 10) {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            VStack (alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(mission.formattedDate)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }.padding(.vertical, 10)
                    })
                    .listRowBackground(Color.darkBackground)
            }
        }
        .listStyle(.plain)
        .background(.darkBackground)
    }
}

struct ListLayout_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        ListLayout(missions: missions, astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

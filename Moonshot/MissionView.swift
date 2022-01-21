//
//  MissionView.swift
//  Moonshot
//
//  Created by Dante Cesa on 1/21/22.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let astronauts: [String: Astronaut]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .clipped()
                        .padding(.top)
                    
                    VStack (alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                         
                        Text(mission.description)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.top, 5)
                    }
                    .padding(.horizontal)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(mission.crew, id:\.name) { crewMember in
                            let astronaut = astronauts[crewMember.name]
                            
                            NavigationLink (destination: {
                                Text("A astronaut detail view")
                            }, label: {
                                Image(astronaut?.id ?? "")
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(Capsule())
                                Text(astronaut?.name ?? "")
                                    .font(.headline.bold())
                                    .foregroundColor(.white)
                            })
                        }
                    }.padding(.horizontal)
                }
            }
        }.navigationTitle(mission.displayName)
            .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        Group {
            MissionView(mission: missions[0], astronauts: astronauts)
                .preferredColorScheme(.dark)
            MissionView(mission: missions[0], astronauts: astronauts)
                .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}

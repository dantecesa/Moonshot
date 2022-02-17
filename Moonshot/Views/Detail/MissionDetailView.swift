//
//  MissionView.swift
//  Moonshot
//
//  Created by Dante Cesa on 1/21/22.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionDetailView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            fatalError("Unable to find \(member.name)")
        }
    }
    
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
                        .accessibilityElement()
                        .accessibilityLabel(mission.badge)
                    
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
                        ForEach(crew, id:\.role) { crewMember in
                            AstronautButton(crewMember: crewMember)
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
            MissionDetailView(mission: missions[0], astronauts: astronauts)
                .preferredColorScheme(.dark)
            MissionDetailView(mission: missions[0], astronauts: astronauts)
                .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}

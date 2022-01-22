//
//  ContentView.swift
//  Moonshot
//
//  Created by Dante Cesa on 1/20/22.
//

import SwiftUI

struct MissionView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let viewTypes: [String] = ["Grid", "List"]
    @State var selectedView: Int = 0
    
    var body: some View {
        NavigationView {
            Group {
                if selectedView == 0 {
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationTitle("Moonshot")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Picker("View Style", selection: $selectedView) {
                        ForEach(0..<viewTypes.count) { index in
                            Text(viewTypes[index])
                        }
                    }.pickerStyle(.segmented)
                }
            }
            MissionDetailView(mission: missions[0], astronauts: astronauts)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView()
    }
}

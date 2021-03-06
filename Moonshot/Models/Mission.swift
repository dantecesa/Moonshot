//
//  Missions.swift
//  Moonshot
//
//  Created by Dante Cesa on 1/20/22.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRoles: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRoles]
    let description: String
    let badge: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

/*
 {
     "id": 1,
     "crew": [
         {
             "name": "grissom",
             "role": "Command Pilot"
         },
         {
             "name": "white",
             "role": "Senior Pilot"
         },
         {
             "name": "chaffee",
             "role": "Pilot"
         }
     ],
     "description": "Apollo 1, initially designated AS-204, was the first crewed mission of the United States Apollo program, the project to land the first men on the Moon.\n\nPlanned as the first low Earth orbital test of the Apollo command and service module, to launch on February 21, 1967, the mission never flew; a cabin fire during a launch rehearsal test at Cape Kennedy Air Force Station Launch Complex 34 on January 27 killed all three crew members—Command Pilot Virgil I. \"Gus\" Grissom, Senior Pilot Ed White, and Pilot Roger B. Chaffee—and destroyed the command module (CM).\n\nThe name Apollo 1, chosen by the crew, was made official by NASA in their honor after the fire."
 }
 */

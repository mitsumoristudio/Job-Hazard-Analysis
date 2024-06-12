//
//  Job_Hazard_AnalysisApp.swift
//  Job Hazard Analysis
//
//  Created by Satoshi Mitsumori on 6/8/24.
//

import SwiftUI

@main
struct Job_Hazard_AnalysisApp: App {
    var body: some Scene {
        WindowGroup {
           // ContentView()
            ProjectAddView(needtoRefresh: .constant(true), projectEntities: ProjectEntity())
        }
    }
}

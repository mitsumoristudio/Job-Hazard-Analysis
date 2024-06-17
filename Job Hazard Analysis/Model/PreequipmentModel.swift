//
//  PreequipmentModel.swift
//  Job Hazard Analysis
//
//  Created by Satoshi Mitsumori on 6/12/24.
//

import Foundation
import SwiftUI

struct PreequipmentModel: Identifiable, Codable {
    var id: UUID?
    var operatorname: String
    var date: Date?
    var equipmentModelName: String
    var equipmentSerialNumber: String?
    
    // From the Ground
    var periodicHeadline: String = "Note: The Periodic Maintenance Checklist as outlined in the Operator's Manual has been completed and any necessary maintenance items have been addressed "
    
    var overall: String = "Overall Machine Appearance"
    var grabbars: String = "ROPS, Grab Bars, Steps, Hand Holds"
    var frame: String = "Frame / Undercarriage"
    var harnesses: String = "Lights, Harnesses, Electrical Items"
    var tires: String = "Tires, Rims, Wheel Locks/ Tracks"
    var undertheMachine: String = "Under the Machine"
    var belts: String = "Belts, Hoses, Hydraulic Cylinders"
    var coolerCOres: String = "Cooler Cores"
    
    // In the Operator's Station need Attention
    var cabWindows: String = "Cab Windows"
    var overallCleanliness: String = "Overall Cleanliness"
    var operatorManual: String = "Operators Manual Present"
    var seats: String = "Seat, Seat Belt, Buckle, Mount"
    var mirror: String = "Mirror, Rear Camera"
    var windshield: String = "Windshield Wipers"
    var defroster: String = "Defroster"
    var gauges: String = "Gauges, Indicator Lights, Switches"
    var fuel: String = "Fuel"
    var fireExtinguisher: String = "Fire Extinguisher"
    var horn: String = "Horn"
    var parkBrakes: String = "Brakes"
    var steering: String = "Steering/Secondary Steering"
    var travelAlarm: String = "Travel Alarm, Backup Alarm"
    var diagnostic: String = "Diagnostic Trouble Codes"
    
    // Fluids
    var engineOils: String = "Engine Oils"
    var hydraulicOils: String = "Hydraulic Oil"
    var transmissionOil: String = "Transmission Oil"
    var engineCoolant: String = "Engine Coolant"
    var washerFluid: String = "Washer Fluid"
    var fuelLevel: String = "Fuel"
    var def: String = "DEF"
    
    
    
}

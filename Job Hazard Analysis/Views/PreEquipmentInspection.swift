//
//  PreEquipmentInspection.swift
//  Job Hazard Analysis
//
//  Created by Satoshi Mitsumori on 6/12/24.
//

import Foundation
import SwiftUI

struct PreEquipmentInspection: View {
    @State var isCompleted: Bool = false
    @Environment(\.dismiss) var dismiss
    @State var dateSelect: Date = Date()
    @State var showAlertIcon: Bool = false
    
    var yesNoArray: Array = ["N/A", "YES", "NO"]
    var safeArray: Array = ["N/A", "Safe", "At Risk"]
    
    private func buttonLabel(withButton placeHolder: String) -> some View {
        Text(placeHolder)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .frame(width: 160, height: 46)
            .background(.indigo)
            .cornerRadius(12)
            .padding(.vertical, 5)
    }
    
    private func titleView(_ value: String, _ color: Color = .black.opacity(0.9)) -> some View {
        Text(value)
            .font(.system(size: 18))
            .foregroundStyle(color)
            .fontWeight(.semibold)
    }
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 20) {
                    titleView("Date")
                    
                    // MARK: Date Picker
                    HStack(alignment: .bottom, spacing: 20) {
                        HStack(spacing: 12) {
                            Text(dateSelect.toString("EEEE dd, MMMM"))
                                .font(.headline)
                            
                        }
                    }
                    
                }
                
            }
        }
        
    }
}

extension Date {
    
    private func toStrings(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

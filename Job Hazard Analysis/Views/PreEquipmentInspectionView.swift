//
//  PreEquipmentInspection.swift
//  Job Hazard Analysis
//
//  Created by Satoshi Mitsumori on 6/12/24.
//

import Foundation
import SwiftUI

struct PreEquipmentInspectionView: View {
    @State var isCompleted: Bool = false
    @Environment(\.dismiss) var dismiss
    @State var dateSelect: Date = Date()
    @State var showAlertIcon: Bool = false
    
    @State var equipmentName: String = ""
    var yesNoArray: Array = ["N/A", "YES", "NO"]
    var safeArray: Array = ["N/A", "Safe", "At Risk"]
    @State var naSelectionOverall: String = "N/A"
    @State var naGrabbars: String = "N/A"
    @State var naFrame: String = "N/A"
    @State var naharnesses: String = "N/A"
    @State var natires: String = "N/A"
    @State var naundertheMachine: String = "N/A"
    
    var backgroundGradientlight =  Color(#colorLiteral(red: 0.7869432202, green: 0.8728674827, blue: 0.8820440269, alpha: 0.6454884106))
    @State var preEquipment: PreequipmentModel
    
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
                VStack(alignment: .leading, spacing: 5) {
                    titleView("Date")
                    
                    // MARK: Date Picker
                    HStack(alignment: .bottom, spacing: 20) {
                        HStack(spacing: 12) {
                            Text(dateSelect.toString("EEEE dd, MMMM"))
                                .font(.headline)
                            
                            Image(systemName: "calendar")
                                .font(.title2)
                                .foregroundColor(Color.blue).opacity(0.75)
                                .overlay {
                                    DatePicker("", selection: $dateSelect, displayedComponents: [.date])
                                        .blendMode(.destinationOver)
                                }
                        }
                        .offset(y: -5)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(.black.opacity(0.8))
                                .frame(height: 1)
                                .offset(y: 5)
                        }
                    }
                    VStack(alignment: .leading) {
                        HStack() {
                            Text("Equipment:")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            TextField("Enter Equipment Name", text: $equipmentName)
                                .font(.headline)
                                .fontWeight(.medium)
                                .padding(.top, 2)
                                .modifier(TextFieldClearButton(nextText: $equipmentName))
                        }
                        Rectangle()
                            .fill(.black.opacity(0.5))
                            .frame(maxHeight: 1.2)
                        
                    }
                    .padding(.vertical, 10)
                }
                .padding(.horizontal)
                
                Group {
                    // MARK: Add Equipment Daily Inspection Here
                    preInspectionCheckView()
                }
                
                VStack(spacing: 8) {
                    Text(preEquipment.periodicHeadline)
                        .font(.subheadline)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .lineLimit(6)
                    
                    Button(action: {
                        
                    }, label: {
                        buttonLabel(withButton: "Submit")
                    })
                }
                .frame(minWidth: 220, minHeight: 60)
                .padding(.horizontal, 10)
           //     .padding(.vertical, 10)
            }
        //    .background(.thinMaterial)
            .background(backgroundGradientlight)
            .padding(.horizontal, 10)
            .navigationTitle("Equipment Pre-Inspection")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    dismiss()
                    
                }, label: {
                    Image(systemName: "chevron.backward.circle")
                        .foregroundColor(Color.white)
                        .background(Color.black, in: Circle())
                        .font(.title)
                })
            }
        }
        
    }
}

struct PreEquipmentInspection_Preview: PreviewProvider {
    static var previews: some View {
        PreEquipmentInspectionView(preEquipment: PreequipmentModel(operatorname: "Johnny", equipmentModelName: "Excavator"))
    }
}

extension Date {
    
    private func toStrings(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

    // MARK: Add PreInspection List Here
extension PreEquipmentInspectionView {
    @ViewBuilder
    func preInspectionCheckView() -> some View {
        List {
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 0) {
                    Text(preEquipment.overall)
                        .fontWeight(.medium)
                        .font(.subheadline)
                    
                    Picker("", selection: $naSelectionOverall, content: {
                        ForEach(safeArray, id: \.self) { safety in
                            Text(safety)
                        }
                    })
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 16)
                }
                .frame(minWidth: 320, alignment: .bottomLeading)
                Divider()
                
                HStack(spacing: 0) {
                    Text(preEquipment.grabbars)
                        .fontWeight(.medium)
                        .font(.subheadline)
                    
                    Picker("", selection: $naGrabbars, content: {
                        ForEach(safeArray, id: \.self) { items in
                            Text(items)
                        }
                    })
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 16)
                }
                .frame(minWidth: 320, alignment: .bottomLeading)
                Divider()
                
                HStack(spacing: 0) {
                    Text(preEquipment.frame)
                        .fontWeight(.medium)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Picker("", selection: $naFrame, content: {
                        ForEach(safeArray, id: \.self) { items in
                            Text(items)
                        }
                    })
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 16)
                }
                .frame(minWidth: 340, alignment: .bottomLeading)
                Divider()
                
                HStack(spacing: 0) {
                    Text(preEquipment.harnesses)
                        .fontWeight(.medium)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Picker("", selection: $naharnesses, content: {
                        ForEach(safeArray, id: \.self) { items in
                            Text(items)
                        }
                    })
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 16)
                }
                .frame(minWidth: 340, alignment: .bottomLeading)
                Divider()
                
                HStack(spacing: 0) {
                    Text(preEquipment.tires)
                        .fontWeight(.medium)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Picker("", selection: $natires, content: {
                        ForEach(safeArray, id: \.self) { items in
                            Text(items)
                        }
                    })
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 16)
                }
                .frame(minWidth: 340, alignment: .bottomLeading)
                Divider()
                
                HStack(spacing: 0, content: {
                    Text(preEquipment.undertheMachine)
                        .fontWeight(.medium)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Picker("", selection: $naundertheMachine, content: {
                        ForEach(safeArray, id: \.self) { items in
                            Text(items)
                        }
                    })
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 16)
                }
                )
                .frame(minWidth: 340, alignment: .bottomLeading)
                Divider()
                
                
                
                
            }
        }
        .frame(minWidth: 400)
    }
}

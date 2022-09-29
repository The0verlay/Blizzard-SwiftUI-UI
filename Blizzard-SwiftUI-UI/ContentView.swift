//
//  ContentView.swift
//  Blizzard-SwiftUI-UI
//
//  Created by Elier Ayala on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let tableView = UITableView.appearance()
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        
    }
    
    @State private var isSelected: Int = 0
    @State private var isSelectedPackage: Int = 0
    @State private var uninstall: Bool = false
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Image("logo")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: 230,height: 230, alignment: .center)
                        .scaledToFit()
                        
                } //MARK: - HStack
                .frame(maxWidth: .infinity, alignment: .center)
                
                Text("BLIZZARD JAILBREAK")
                    .font(.system(size: 22, weight: .heavy, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Button {
                    //void
                } label: {
                    Text("Jailbreak")
                        .font(.system(size: 17, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                    
                        
                } //MARK: - Button
                .buttonStyle(PlainButtonStyle())
                   
            } //MARK: - Section
             .listRowBackground(Color.clear)
        
            Section {
                button(title: "Block Pirate Repos (Safer)", isOn: $isSelected, value: 0, isStepper: false)
                button(title: "Disable anti-piracy", isOn: $isSelected, value: 1, isStepper: false)
            } header: {
                Text("SECURITY")
                    .font(.system(size: 12, weight: .heavy, design: .rounded))
            } //MARK: - Section
            .listRowBackground(Color.clear)

            
            Section {
                HStack {
                    button(title: "Install Zebra", isOn: $isSelectedPackage, value: 0, isStepper: true)
                    button(title: "Install Sileo", isOn: $isSelectedPackage, value: 1, isStepper: true)
                }

                Toggle("Uninstall Blizzard JB", isOn: $uninstall)
                    .padding(.horizontal)
                    .toggleStyle(SwitchToggleStyle(tint: Color("centerGradientColor")))
                    .font(.system(size: 17, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                
                Text("iOS \(UIDevice.current.systemVersion) - by GeoSnOw (@FCE365)")
                    .frame(maxWidth: .infinity,alignment: .center)
            } header: {
                Text("PACKAGE MANAGER")
                    .font(.system(size: 12, weight: .heavy, design: .rounded))
            } //MARK: - Section
            .listRowBackground(Color.clear)
            
        } //MARK: - Form
        .background(LinearGradient(colors: [Color("topGradientColor"), Color("centerGradientColor"), Color("bottomGradientColor")], startPoint: .topLeading, endPoint: .bottomTrailing))
    } //MARK: - Body
    
    @ViewBuilder
    func button(title: String, isOn: Binding<Int>, value: Int, isStepper: Bool) -> some View {
        Button {
            isOn.wrappedValue = value
        } label: {
            Label {
                Text("\(title)")
                    .font(.system(size: 17, weight: .heavy, design: .rounded))
                    .foregroundColor(!isStepper ? .white : (isOn.wrappedValue == value ? Color("centerGradientColor") : Color.white))
                
                if !isStepper {
                    Spacer()
                    Image(systemName: isOn.wrappedValue == value ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(isOn.wrappedValue == value ? Color("centerGradientColor") : .white)
                }
            } icon: {
                //ignore icon View
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .frame(height: 50)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
            
        }.buttonStyle(PlainButtonStyle())
    } //MARK: - ViewBuilder
}

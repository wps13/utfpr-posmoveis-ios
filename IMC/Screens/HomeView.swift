//
//  HomeView.swift
//  IMC
//
//  Created by Willane Paiva on 20/06/26.
//

import SwiftUI

struct HomeView: View {
    // Property wrapper - add comportamento extra
    @State private var userName: String = ""
    @State private var selectedGender: Gender = .male
    @State private var height: Int = 180
    @State private var weight: Int = 70
    
    var body: some View {
        VStack(spacing: 22) {
            titleView
            nameField
            mainImage
            genderSelectionButton
            measureViews
            calculateIMCButton
            Spacer()
        }
        .background(Color.accentColor.opacity(0.15))
    }
    
    // MARK: - Title
    var titleView: some View {
        Text("Calculadora de IMC")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
    }
    
    // MARK: - Name field
    var nameField: some View {
        HStack {
            Image(systemName: "person.fill")
            TextField("Digite seu nome", text: $userName)
                .textFieldStyle(.plain)
                .font(.title3)
        }.padding(12)
            .background(.background)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 32))
            .shadow(color: Color(white: 0.9), radius: 8)
            .padding()
    }
    
    // MARK: - Main image
    var mainImage: some View {
        Image("\(selectedGender.rawValue)3")
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 260)
    }
    
    // MARK: - Gender Selection Buttons
    var genderSelectionButton: some View {
        HStack (spacing: 60) {
            GenderButton(
                gender: .male,
                isSelected: selectedGender == .male
            ){
                selectedGender = .male
            }
            GenderButton(
                gender: .female,
                isSelected: selectedGender == .female
            ){
                selectedGender = .female
            }
        }
    }
    
    //MARK: - Measure Views
    var measureViews: some View {
        VStack {
            MeasureView(
                image: "pencil.and.ruler",
                text: "Altura (cm)",
                value: $height
            )
            MeasureView(
                image: "scalemass.fill",
                text: "Peso (kg)",
                value: $weight
            )
        }.padding()
    }
    
    //MARK: - Calculate IMC Button
    var calculateIMCButton: some View {
        AppButton(
            action: {},
            text: "Calcular IMC"
        )
    }
    
}

#Preview {
    HomeView()
}

//
//  SliderView.swift
//  NewTestProject
//
//  Created by Gdwn on 25/10/2024.
//

import SwiftUI

struct SliderView: View {
    
    @State private var sliderVolume : Double = 0
    @State private var reachedMax : Bool = false
    @State private var isEditingSlider : Bool = false
    private let range : ClosedRange<Double> = 0...100
    private let step : Double = 5
    
    var body: some View {
        VStack {
            Text("Current volume : \(Int(sliderVolume))")
                .font(.system(size: 20))
                .bold()
            
            if (reachedMax) {
                    Text("You've reached the end")
                        .foregroundColor(.gray)
            }
            // add a slider
            Slider(
                value: $sliderVolume,
                in: range,
                step: step) { // increment by this value
                    isEditing in
                    isEditingSlider = isEditing
                    reachedMax = false
                }
            
            Slider(value: $sliderVolume, in: range, step: step) {
                Image(systemName: "person") // label doesn't work though
            } minimumValueLabel: { // shows on the left
                Text("\(Int(range.lowerBound))")
            } maximumValueLabel: { // shows on the right
                Text("\(Int(range.upperBound))")
            }

            
            HStack {
                MainButton(label: "Decrease", icon: "minus", color: .red, fillContainer: true, disabled: isEditingSlider){
                    withAnimation {
                        decVol()
                    }
                }
                
                MainButton(label: "Increase", icon: "plus", color: .green, fillContainer: true, disabled: isEditingSlider){
                    withAnimation {
                        incVol()
                    }
                }
            }
        }
        .padding()
    }
}

private extension SliderView {
    // for functions
    func decVol() {
        guard sliderVolume > range.lowerBound else {
//            withAnimation { reachedMax = true }
            reachedMax = true
            return
        }
        sliderVolume -= step
//        withAnimation { reachedMax = false }
        reachedMax = false
    }
    
    func incVol() {
        guard sliderVolume < range.upperBound else {
//            withAnimation { reachedMax = true }
            reachedMax = true
            return
        }
        sliderVolume += step
//        withAnimation { reachedMax = false }
        reachedMax = false
    }
}

#Preview {
    SliderView()
}

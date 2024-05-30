//
//  ContentView.swift
//  Animated Nav Bar
//
//  Created by Haseeb Khan on 28/05/2024.
//

import SwiftUI

// MARK: Menu Toggler Button
struct HamburgerToX: View {
    @Binding var isRotating: Bool
    @Binding var isHidden: Bool
    @Binding var isExpanded: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 2)
                .frame(width: 80, height: 80)
                .background(.clear)
                .contentShape(Circle())
                .overlay(
                    ZStack {
                        Rectangle()
                            .frame(width: 40, height: 2)
                            .cornerRadius(1)
                            .rotationEffect(isRotating ?
                                            Angle(degrees: 45):
                                                Angle(degrees: 0),
                                            anchor: .center
                            )
                            .offset(y: isRotating ? 0 : -10)
                        
                        Rectangle()
                            .frame(width: 40, height: 2)
                            .cornerRadius(1)
                            .scaleEffect(
                                x: isHidden ? 0:1,
                                y: isHidden ? 0:1,
                                anchor: .center
                            )
                            .opacity(isHidden ? 0 : 1)
                        
                        Rectangle()
                            .frame(width: 40, height: 2)
                            .cornerRadius(1)
                            .rotationEffect(isRotating ?
                                            Angle(degrees: -45):
                                                Angle(degrees: 0),
                                            anchor: .center
                            )
                            .offset(y: isRotating ? 0 : 10)
                    }
                        .foregroundStyle(.white)
                )
        }
        .onTapGesture {
            withAnimation(
                .interpolatingSpring(stiffness: 300, damping: 15)) {
                    isRotating.toggle()
                    isHidden.toggle()
                    isExpanded.toggle()
                }
        }
    }
}

// MARK: Menu Bar
struct CapsuleWithButtons: View {
    @Binding var isExpanded: Bool

    var body: some View {
        Capsule(style: .circular)
            .stroke(Color.white, lineWidth: 2)
            .frame(width: 80, height: 460)
            .background(Color.clear)
            .contentShape(Capsule())
            .overlay(
                VStack {
                    Spacer()
                    
                    Button(action: {
                        // Action for button 1
                    }) {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Action for button 2
                    }) {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Action for button 3
                    }) {
                        Image(systemName: "link")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }

                    Spacer()
                    
                    Button(action: {
                        // Action for button 4
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
            )
            .offset(y: isExpanded ? 0 : 160)
            .scaleEffect(isExpanded ? 1 : 0.1, anchor: .bottom)
            .opacity(isExpanded ? 1 : 0)
            .animation(.interpolatingSpring(stiffness: 300, damping: 16), value: isExpanded)
    }
}

struct ContentView: View {
    
    @State var isRotating: Bool = false
    @State var isHidden: Bool = false
    @State private var isExpanded: Bool = false
    
    var body: some View {
        ZStack {
            Color.pink.ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("Free Palestine 🇵🇸")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                
                Spacer()
                
                CapsuleWithButtons(isExpanded: $isExpanded)
                
                HamburgerToX(
                    isRotating: $isRotating,
                    isHidden: $isHidden,
                    isExpanded: $isExpanded
                )
            }
            
        }
    }
}

#Preview {
    ContentView()
}

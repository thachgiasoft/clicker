//
//  Home.swift
//  Clicker
//
//  Created by James Erringham-Bruce on 03/07/2021.
//

import SwiftUI

struct Home: View {
    @State private var shouldShowSpeedRun = false
    @State private var shouldShowHardcore = false
    
    var body: some View {
        ZStack {
            Color(red: 34/255, green: 40/255, blue: 49/255).ignoresSafeArea()
            VStack {
                HStack {
                    VStack {
                        Text("Clicker")
                            .modifier(PoppinsFont(.semiBold, size: 50))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        Text("How fast are you?")
                            .modifier(PoppinsFont(.light, size: 20))
                            .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    Spacer()
                    
                    Image(systemName: "target")
                        .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
                        .font(.system(size: 66.0))
                        .padding(.trailing, 50)
                }
                Spacer()
                
                VStack {
                    Button(action: {
                        self.shouldShowSpeedRun.toggle()
                    }) {
                        ButtonView(image: "bolt.fill", text: "Speed Run")
                    }
                    .fullScreenCover(isPresented: $shouldShowSpeedRun, content: SpeedRun.init)
                    
                    Text("How many targets can you click in 30 seconds?")
                        .modifier(PoppinsFont(.light, size: 14))
                        .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                        .multilineTextAlignment(.center)
                }
                .padding()
                VStack {
                    Button(action: {
                        self.shouldShowHardcore.toggle()
                    }) {
                        ButtonView(image: "exclamationmark.triangle.fill", text: "Hardcore")
                    }
                    .fullScreenCover(isPresented: $shouldShowHardcore, content: Hardcore.init)
                    
                    Text("Same as before - except smaller targets!")
                        .modifier(PoppinsFont(.light, size: 14))
                        .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct ButtonView: View {
    var image: String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
                .font(.system(size: 30.0))
            Text(text)
                .modifier(PoppinsFont(.medium, size: 20))
                .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
        }
        .frame(width: 150, height: 40, alignment: .center)
        .padding(10.0)
        .overlay(
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(lineWidth: 2.0)
                .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
        )
    }
}

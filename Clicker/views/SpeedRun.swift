//
//  SpeedRun.swift
//  Clicker
//
//  Created by James Erringham-Bruce on 03/07/2021.
//

import SwiftUI

struct SpeedRun: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel = SpeedRunViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 34/255, green: 40/255, blue: 49/255).ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "chevron.left.circle.fill")
                        .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
                        .font(.system(size: 30))
                        .onTapGesture(perform: {
                            presentationMode.wrappedValue.dismiss()
                        })
                    VStack(alignment: .leading) {
                        Text("High Score: \(viewModel.highScore)")
                            .modifier(PoppinsFont(.light, size: 20))
                            .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                            .multilineTextAlignment(.leading)
                        Text("\(viewModel.timeRemaining) seconds remaining")
                            .modifier(PoppinsFont(.light, size: 16))
                            .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                            .multilineTextAlignment(.leading)
                    }
                    
                    Spacer()
                    Text("\(viewModel.currentScore)")
                        .modifier(PoppinsFont(.medium, size: 50))
                        .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 10)
                
                Image(systemName: viewModel.target.imageName)
                    .foregroundColor(Color(red: 1, green: 30/255, blue: 60/255))
                    .font(.system(size: viewModel.target.size))
                    .position(x: viewModel.target.randX, y: viewModel.target.randY)
                    .onTapGesture(perform: {
                        viewModel.targetWasHit()
                        viewModel.checkHighScore()
                    })
                Spacer()
            }
        }
        .onAppear() {
            viewModel.changePosition()
        }
        .onReceive(viewModel.timer) { _ in
            viewModel.countdown()
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame() }))
        })
        .presentInterstitialAd(isPresented: $viewModel.showIntersitialAd, adUnitId: "ca-app-pub-4048481923671206/9399673564")
    }
}

struct SpeedRun_Previews: PreviewProvider {
    static var previews: some View {
        SpeedRun()
    }
}

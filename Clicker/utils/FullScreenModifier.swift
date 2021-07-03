//
//  FullScreenModifier.swift
//  Clicker
//
//  Created by James Erringham-Bruce on 03/07/2021.
//

import SwiftUI

struct FullScreenModifier<Parent: View>: View {
    @Binding var isPresented: Bool
    
    var adUnitId: String
    var parent: Parent
    
    var body: some View {
        ZStack {
            parent
            
            if isPresented {
                EmptyView()
                    .edgesIgnoringSafeArea(.all)
                InterstitialAdView(isPresented: $isPresented, adUnitId: adUnitId)
            }
        }
        .onAppear {
            InterstitialAd.shared.loadAd(withAdUnitId: adUnitId)
        }
    }
}

extension View {
    public func presentInterstitialAd(isPresented: Binding<Bool>, adUnitId: String) -> some View {
        FullScreenModifier(isPresented: isPresented, adUnitId: adUnitId, parent: self)
    }
}

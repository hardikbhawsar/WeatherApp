//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Hardik Bhawsar on 4/18/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .frame(maxWidth: .infinity, maxHeight:.infinity)
    }
}

#Preview {
    LoadingView()
}

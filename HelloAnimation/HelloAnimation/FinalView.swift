//
//  FinalView.swift
//  HelloAnimation
//
//  Created by Saqib Adnan on 09/03/2024.
//

import SwiftUI

struct FinalView: View {
    
    @State private var progress: CGFloat = 0
    
    var body: some View {
        VStack {
            HelloShape()
                .trim(from: 0.0, to: progress)
                .stroke(Self.gradient, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .aspectRatio(contentMode: .fit)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .onAppear(perform: animate)
        .onTapGesture {
            progress = 0
            animate()
        }
    }
}

private extension FinalView {
    static let gradient = LinearGradient(
        gradient: Gradient(colors: [.black, .purple, .orange, .red, .pink, .purple, .blue, .black]),
        startPoint: .leading, endPoint: .trailing
    )
    func animate() {
        withAnimation(.easeInOut(duration: 3)) {
            progress = 1
        }
    }
}

#Preview {
    FinalView()
}

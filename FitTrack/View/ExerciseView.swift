//
//  Exercise.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 03.01.2026.
//

import SwiftUI

struct ExerciseView: View {

    let title: String
    let description: String
    let onDelet: (() -> Void)?

    init(title: String, description: String, onDelet: (() -> Void)? = nil) {
        self.title = title
        self.description = description
        self.onDelet = onDelet
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 25, weight: .medium))
                Text(description)
                    .foregroundStyle(.white)
                    .font(.system(size: 15, weight: .medium))

            }
            .padding(10)
            Spacer()
            Button(action: {

            }, label: {
                Image(systemName: "trash")
                    .foregroundStyle(.red)
            })
            .padding(10)
        }
        .padding(12)
        .background(.exercise)
        .cornerRadius(12)
    }
}

#Preview {
    VStack {
        ExerciseView(title: "Плечи", description: "3 x 10 Cпина")
    }
    .padding()
}

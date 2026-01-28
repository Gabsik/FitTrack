//
//  Exercise.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 03.01.2026.
//

import SwiftUI

struct ExerciseView: View {

    let title: String
    let sets: Int
    let reps: Int
    let category: String
    let weight: Int
    let onDelet: (() -> Void)?

    init(title: String, sets: Int, reps: Int, weight: Int, category: String, onDelet: (() -> Void)? = nil) {
        self.title = title
        self.sets = sets
        self.reps = reps
        self.category = category
        self.weight = weight
        self.onDelet = onDelet
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .medium))
                    Text("\(sets) x \(reps) • \(weight) кг • \(category)")
                        .foregroundStyle(.white)
                        .font(.system(size: 10, weight: .light))
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
        .padding(7)
        .background(.exercise)
        .cornerRadius(12)
    }
}

#Preview {
    VStack {
        ExerciseView(title: "Жим лежа", sets: 4, reps: 10,  weight: 50, category: "Грудь" )
    }
    .padding()
}

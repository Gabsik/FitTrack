//
//  MyExercisesView.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 30.12.2025.
//

import SwiftUI
struct MyExercisesView: View {

    var viewModel: MyExercisesViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                header
                content
            }
        }
        .background(Color.backgroundContent.ignoresSafeArea())
    }

    var header: some View {
        VStack {
            HStack {
                Image(.dumbbell)
                Text("Библиотека упражнений")
                    .foregroundStyle(.white)
                    .font(.system(size: 23, weight: .bold))
                Spacer()
                Button(action: { dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal)
            exercisesButton
        }
    }

    //MARK: - exercisesButton
    var exercisesButton: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 13) {
                ForEach(viewModel.arryButton, id: \.self) { item in
                    Button(action: {
                        print("нажали на \(item)")
                    }) {
                        Text(item)
                            .font(.system(size: 13, weight: .regular))
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.backgroundTitle)
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.backgroundBorder, lineWidth: 2)
                            }
                    }
                }
            }
            .padding(5)
        }
        .padding(.leading, 10)
    }

    var content: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.exercises, id: \.id) { item in
                    exercise(item)
                }
            }
            .padding(.horizontal, 10)
            foter
        }
    }

    //FOTER
    var foter: some View {
        Button {

        } label: {
            Text("CОЗДАТЬ УПРАЖНЕНИЯ")
                .font(.system(size: 20, weight: .bold))
                .padding(10)
                .foregroundColor(.backgroundTitle)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.backgroundButton)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.backgroundBorder, lineWidth: 3)
        )
        .padding(.horizontal, 10)
    }


    func exercise(_ item: ExerciseModel) -> some View {
        ExerciseView(title: item.name,
                     sets: item.sets,
                     reps: item.reps,
                     weight: item.weight,
                     category: item.category
        )
    }
}

#Preview {
    MyExercisesView(viewModel: MyExercisesViewModel())
}

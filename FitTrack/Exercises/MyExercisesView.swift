//
//  MyExercisesView.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 30.12.2025.
//

import SwiftUI


struct MyExercisesView: View {

    var viewModel: MyExercisesViewModel
    var body: some View {
        VStack {
            header
            Spacer()
        }
    }

    var header: some View {
        VStack {
            HStack {
                Image(.dumbbell)
                Text("Библиотека упражнений")
                    .foregroundStyle(.white)
                    .font(.system(size: 23, weight: .bold))
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal)
            exercisesButton
        }
        .background(Color.backgroundContent.ignoresSafeArea())
    }

    //MARK: - exercisesButton
    var exercisesButton: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.arryButton, id: \.self) { item in
                    Button(action: {
                        print("нажали на \(item)")
                    }) {
                        Text(item)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            }
                    }
                }
            }
            .padding(5)
        }
    }

    var content: some View {
        ScrollView {
            exercise(item)

        }
    }

    func exercise(_ item: ExerciseModel) {
        ExerciseView(
            title: item.name,
            description: item.numberOfRepetitions
        )
    }
}

#Preview {
    MyExercisesView(viewModel: MyExercisesViewModel())
}

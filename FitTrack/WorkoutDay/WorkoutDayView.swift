//
//  WorkoutDayView.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 29.01.2026.
//

import SwiftUI

struct WorkoutDayView: View {
    @Environment(\.dismiss) var dismiss

    @ObservedObject var viewModel: WorkoutDayViewModel

    var body: some View {
        ZStack {
            VStack {
                headr
                Spacer()
                buttonAddExercises
                Spacer()
            }
        }
        .background(Color.backgroundContent.ignoresSafeArea())
        .onAppear {
            viewModel.bind()
        }
    }

    var headr: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(
                viewModel.state.selectedDate
                    .formatted(
                        .dateTime
                            .day()
                            .month(.wide)
                            .year()
                            .locale(Locale(identifier: "ru_RU"))
                    )
            )
            .foregroundColor(.white)
            .padding(.leading, 10)
            TextField("Введите название тренировки", text: $viewModel.state.nameWorkout)
                .foregroundColor(.white)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.1)))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.frameBackground, lineWidth: 1)
                )
                .padding(.horizontal, 10)

            Text("Добавтье упражнения")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding(.leading, 10)
                .padding(.bottom, 10)
        }
        .background(Color.background.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        //MARK: - Добавить свою кнопку "назад" в навигацию
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(.back)
                            .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                    }
                }
            }
        }
    }

    var buttonAddExercises: some View {
        Button(action: { viewModel.input?(.myExercisesTapped) })
        {
            VStack {
                Image(.plus)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                Text("Добавить упражнение")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .regular))
            }
        }
    }
}


#Preview {
    WorkoutDayView(viewModel: WorkoutDayViewModel(state: .init(nameWorkout: "Ноги и Плечи", selectedDate: Date()), output:  { _ in }))
}

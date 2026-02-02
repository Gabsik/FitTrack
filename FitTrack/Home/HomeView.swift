//
//  ContentView.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 27.11.2025.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 0) {
            title
            content
        }
        .onAppear {
            viewModel.bind()
        }
    }

    //MARK: - HEADER
    var title: some View {
        VStack (alignment: .leading) {
            HStack  {
                Image(.dumbbell)
                Text("Мои тренировки")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
            }
            Text("Выберите день для тренировки")
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .padding(.top, 1)
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
        .background(Color.background.ignoresSafeArea())
    }

    //MARK: - Content
    var content: some View {
        VStack (alignment: .center, spacing: 10) {
            HStack {
                Image(.calendar)
                Text("Календарь тренировок")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding()
            FSCalendarView(
                selectedDate: Binding(
                    get: { viewModel.state.selectedDate },
                    set: { viewModel.state.selectedDate = $0 }
                )
            )
                .padding(.horizontal, 20)
                .frame(height: 310)
            myExercisesButton
                .padding()
            Spacer()
            continueButton
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.backgroundContent.ignoresSafeArea())
    }

    // MARK: - BUTTON MY EXERCISES
    var myExercisesButton: some View {
        HStack {
            Button(action: { viewModel.input?(.myExercisesTapped)
            }) {
                Image(systemName: "gearshape.fill")
                    .foregroundStyle(.backgroundTitle)
                Text("Мои упражнения")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.backgroundTitle)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.backgroundButton)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.backgroundBorder, lineWidth: 3)
            }
        }
    }

    // MARK: - CONTINUEBUTTON
    var continueButton: some View {
        Button(action: { viewModel.input?(.workoutDayViewTapped)
        }) {
            Text(viewModel.state.selectedDate == nil ? "Выберите дату" : "Продолжить")
                    .font(.system(size: 20, weight: .bold))
                    .padding(10)
                    .foregroundColor(.white)
            }
        .disabled(viewModel.state.selectedDate == nil)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.background)
        )
    }
}

#Preview {
    HomeView(viewModel:
            .init(
                state: .init(),
                output: { _ in })
    )
}

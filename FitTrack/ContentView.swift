//
//  ContentView.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 27.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate: Date? = nil
    var body: some View {
        VStack(spacing: 0) {
            title
            content
        }
    }

    //MARK: - HEADER
    var title: some View {
        VStack (alignment: .leading) {
            HStack  {
                Image(.dumbbell)
                Text("Мои тренировки")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
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
        //            .frame(maxWidth: .infinity, alignment: .leading)
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
            FSCalendarView()
            //                    .tint(.white)
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
}

// MARK: - BUTTON MY EXERCISES
var myExercisesButton: some View {
    HStack {
        Button(action: {
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

var continueButton: some View {
    Button(action: {

    }) {
        Text("Продолжить")
            .font(.system(size: 20, weight: .bold))
            .padding(10)
            .foregroundColor(.backgroundTitle)
    }
    .frame(maxWidth: .infinity)
    .frame(height: 50)
    .background(.backgroundButton)
    .overlay {
        RoundedRectangle(cornerRadius: 15) // Форма рамки
            .stroke(Color.backgroundBorder, lineWidth: 3)
    }
}

#Preview {
    ContentView()
}

//
//  CreateExerciseView.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 03.02.2026.
//

import SwiftUI
import SwiftData

struct CreateExerciseView: View {
    @ObservedObject var viewModel: CreateExerciseViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.backgroundContent.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 16) {

                nameField
                categorySection
                metricsSection
                actionButtons
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.background)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.backgroundBorder, lineWidth: 2)
            )
            .padding(.horizontal, 16)
        }
    }

    private var nameField: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Название упражнения")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.leading, 5)
                Spacer()
                Button(action: { dismiss() })
                {
                    Image(systemName: "xmark")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold))
                }
            }
            TextField("Название упражнения", text: $viewModel.state.name)
                .foregroundColor(.white)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.backgroundContent)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.5), lineWidth: 2)
                )
        }
    }

    private var categorySection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Категория")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))

            Menu {
                ForEach(viewModel.state.categories, id: \.self) { item in
                    Button(action: {
                        viewModel.state.category = item
                    }) {
                        Text(item)
                    }
                }
            } label: {
                HStack {
                    Text(viewModel.state.category)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .regular))
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white.opacity(0.6))
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.backgroundContent)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.5), lineWidth: 2)
                )
            }
        }
    }

    private var metricsSection: some View {
        HStack(spacing: 12) {
            metricField(title: "Подходы", text: $viewModel.state.sets)
            metricField(title: "Повт.", text: $viewModel.state.reps)
            metricField(title: "Вес", text: $viewModel.state.weight)
        }
    }

    private func metricField(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .bold))
            TextField("", text: text)
                .keyboardType(.numberPad)
                .foregroundColor(.white)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.backgroundContent)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white.opacity(0.5), lineWidth: 2)
                )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var actionButtons: some View {
        HStack(spacing: 12) {
            Button(action: { dismiss() }) {
                Text("Отмена")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.backgroundTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    )
            }

            Button(action: {
                viewModel.createExercise()
                dismiss()
            }) {
                Text("Добавить")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.backgroundBorder)
                    )
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(
        for: ExerciseEntity.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    CreateExerciseView(
        viewModel: CreateExerciseViewModel(
            state: .init(name: "", category: "", sets: "", reps: "", weight: "", categories: [""]),
            modelContext: container.mainContext
        )
    )
}

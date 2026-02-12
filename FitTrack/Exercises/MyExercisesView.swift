//
//  MyExercisesView.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 30.12.2025.
//

import SwiftUI
import SwiftData

struct MyExercisesView: View {

    @ObservedObject var viewModel: MyExercisesViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                header
                content
            }
        }
        .background(Color.backgroundContent.ignoresSafeArea())
        .onAppear {
            viewModel.bind()
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
                ForEach(["Все"] + ExerciseCategory.allCases.map(\.title), id: \.self) { item in
                    Button(action: {
                        viewModel.selectedCategory = item
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
                ForEach(viewModel.filteredExercises, id: \.id) { item in
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
            viewModel.input?(.createExerciseTapped)
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
        let categoryTitle = ExerciseCategory(rawValue: item.categoryId)?.title ?? item.categoryId
        return ExerciseView(title: item.name,
                     sets: item.sets ?? 0,
                     reps: item.reps ?? 0,
                     weight: item.weight ?? 0,
                     category: categoryTitle
        )
    }
}

#if DEBUG
#Preview {
    MyExercisesView(
        viewModel: MyExercisesViewModel(modelContext: MyExercisesPreviewData.context)
    )
    .modelContainer(MyExercisesPreviewData.container)
}


private enum MyExercisesPreviewData {
    static let container: ModelContainer = {
        let container = try! ModelContainer(
            for: ExerciseEntity.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        return container
    }()

    static let context: ModelContext = {
        let context = ModelContext(container)
        context.insert(
            ExerciseEntity(
                name: "Жим лежа",
                sets: 4,
                reps: 8,
                weight: 60,
                categoryId: ExerciseCategory.chest.id
            )
        )
        context.insert(
            ExerciseEntity(
                name: "Присед",
                sets: 5,
                reps: 5,
                weight: 80,
                categoryId: ExerciseCategory.legs.id
            )
        )
        try? context.save()
        return context
    }()
}

#endif

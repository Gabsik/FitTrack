//
//  ViewModel.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 30.12.2025.
//

import Foundation

final class HomeViewModel: ObservableObject {

    @Published var state: State

    private let output: (Output) -> Void
    var input: ((Input) -> Void)?

    init(
        state: State,
        output: @escaping (Output) -> Void
    ) {
        self.state = state
        self.output = output
    }

    func bind () {
        self.input = { [weak self] input in
            guard let self else { return }
            switch input {
            case .myExercisesTapped:
                output(.showMyExercises)
            case .workoutDayViewTapped:
                guard let date = state.selectedDate else { return }
                output(.showWorkoutDayView(date))
            }
        }
    }
}
extension HomeViewModel {
    struct State {
        var selectedDate: Date?
        var isButtonDisabled: Bool = false
    }
}

extension HomeViewModel {
    enum Input {
        case myExercisesTapped
        case workoutDayViewTapped
    }
}

extension HomeViewModel {
    enum Output {
        case showMyExercises
        case showWorkoutDayView(Date)
    }
}

